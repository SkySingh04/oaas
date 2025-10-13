import { useState, useCallback, useEffect, useMemo } from 'react';
import './App.css';

type Platform = 'linux' | 'windows' | 'macos';

interface ReportData {
  job_id: string;
  source_file: string;
  platform: string;
  obfuscation_level: number;
  enabled_passes: string[];
  compiler_flags: string[];
  timestamp: string;
  output_attributes: {
    file_size: number;
    binary_format: string;
    sections: Record<string, number>;
    symbols_count: number;
    functions_count: number;
    entropy: number;
    obfuscation_methods: string[];
  };
  bogus_code_info: {
    dead_code_blocks: number;
    opaque_predicates: number;
    junk_instructions: number;
    code_bloat_percentage: number;
  };
  cycles_completed: {
    total_cycles: number;
    per_cycle_metrics: Array<{
      cycle: number;
      passes_applied: string[];
      duration_ms: number;
    }>;
  };
  string_obfuscation: {
    total_strings: number;
    encrypted_strings: number;
    encryption_method: string;
    encryption_percentage: number;
  };
  fake_loops_inserted: {
    count: number;
    types: string[];
    locations: string[];
  };
  symbol_obfuscation: {
    enabled: boolean;
    symbols_obfuscated?: number;
    algorithm?: string;
  };
  obfuscation_score: number;
  symbol_reduction: number;
  function_reduction: number;
  size_reduction: number;
  entropy_increase: number;
  estimated_re_effort: string;
}

function App() {
  const [darkMode, setDarkMode] = useState(true);
  const [serverStatus, setServerStatus] = useState<'checking' | 'online' | 'offline'>('checking');
  const [file, setFile] = useState<File | null>(null);
  const [inputMode, setInputMode] = useState<'file' | 'paste'>('file');
  const [pastedSource, setPastedSource] = useState('');
  const [jobId, setJobId] = useState<string | null>(null);
  const [downloadUrls, setDownloadUrls] = useState<Record<Platform, string | null>>({
    linux: null,
    windows: null,
    macos: null
  });
  const [binaryName, setBinaryName] = useState<string | null>(null);
  const [report, setReport] = useState<ReportData | null>(null);
  const [loading, setLoading] = useState(false);
  const [toast, setToast] = useState<string | null>(null);
  const [progress, setProgress] = useState<{ message: string; percent: number } | null>(null);
  const [detectedLanguage, setDetectedLanguage] = useState<'c' | 'cpp' | null>(null);

  // Layer states
  const [layer0, setLayer0] = useState(false); // Symbol obfuscation
  const [layer1, setLayer1] = useState(false); // Compiler flags
  const [layer2, setLayer2] = useState(false); // OLLVM passes
  const [layer3, setLayer3] = useState(false); // Targeted obfuscation
  const [layer4, setLayer4] = useState(false); // VM obfuscation

  // Configuration states
  const [obfuscationLevel, setObfuscationLevel] = useState(3);
  const [cycles, setCycles] = useState(1);
  const [targetPlatform, setTargetPlatform] = useState<Platform>('linux');
  const [fakeLoops, setFakeLoops] = useState(0);
  const [selectedFlags, setSelectedFlags] = useState<string[]>([]);

  // Symbol obfuscation config
  const [symbolAlgorithm, setSymbolAlgorithm] = useState('sha256');
  const [symbolHashLength, setSymbolHashLength] = useState(12);
  const [symbolPrefix, setSymbolPrefix] = useState('typed');
  const [symbolSalt, setSymbolSalt] = useState('');

  useEffect(() => {
    document.body.className = darkMode ? 'dark' : 'light';
  }, [darkMode]);

  useEffect(() => {
    fetch('/api/health')
      .then(res => setServerStatus(res.ok ? 'online' : 'offline'))
      .catch(() => setServerStatus('offline'));
  }, []);

  // Auto-detect language
  const detectLanguage = useCallback((filename: string, content?: string): 'c' | 'cpp' => {
    const ext = filename.toLowerCase().split('.').pop();
    if (ext === 'cpp' || ext === 'cc' || ext === 'cxx' || ext === 'c++') return 'cpp';
    if (ext === 'c') return 'c';

    if (content) {
      const cppIndicators = [
        /\bclass\b/, /\bnamespace\b/, /\btemplate\s*</, /\bstd::/,
        /\b(public|private|protected):/, /#include\s*<(iostream|string|vector)>/,
        /\bvirtual\b/, /\boperator\s*\(/
      ];
      if (cppIndicators.some(regex => regex.test(content))) return 'cpp';
    }
    return 'c';
  }, []);

  const onPick = useCallback((e: React.ChangeEvent<HTMLInputElement>) => {
    const nextFile = e.target.files?.[0] ?? null;
    setFile(nextFile);
    if (nextFile) {
      setInputMode('file');
      const lang = detectLanguage(nextFile.name);
      setDetectedLanguage(lang);
      setToast(`Detected ${lang.toUpperCase()} source file`);
      setTimeout(() => setToast(null), 3000);
    }
  }, [detectLanguage]);

  const fileToBase64 = (f: File) =>
    new Promise<string>((resolve, reject) => {
      const reader = new FileReader();
      reader.onload = () => {
        const result = reader.result;
        if (typeof result === 'string') {
          const [, base64] = result.split(',');
          resolve(base64 ?? result);
        } else {
          reject(new Error('Failed to read file'));
        }
      };
      reader.onerror = () => reject(reader.error);
      reader.readAsDataURL(f);
    });

  const stringToBase64 = (value: string) => {
    const encoder = new TextEncoder();
    const bytes = encoder.encode(value);
    let binary = '';
    bytes.forEach((byte) => { binary += String.fromCharCode(byte); });
    return btoa(binary);
  };

  // Handle cascading layer selection
  const handleLayerChange = (layer: number, value: boolean) => {
    if (value) {
      // Enable this layer and all previous layers
      if (layer >= 0) setLayer0(true);
      if (layer >= 1) setLayer1(true);
      if (layer >= 2) setLayer2(true);
      if (layer >= 3) setLayer3(true);
      if (layer >= 4) setLayer4(true);
    } else {
      // Disable this layer and all subsequent layers
      if (layer <= 0) setLayer0(false);
      if (layer <= 1) setLayer1(false);
      if (layer <= 2) setLayer2(false);
      if (layer <= 3) setLayer3(false);
      if (layer <= 4) setLayer4(false);
    }
  };

  const onSubmit = useCallback(async () => {
    if (inputMode === 'file' && !file) {
      setToast('Choose a source file');
      setTimeout(() => setToast(null), 3000);
      return;
    }
    if (inputMode === 'paste' && pastedSource.trim().length === 0) {
      setToast('Paste source code before submitting');
      setTimeout(() => setToast(null), 3000);
      return;
    }

    setLoading(true);
    setReport(null);
    setDownloadUrls({ linux: null, windows: null, macos: null });
    setBinaryName(null);
    setProgress({ message: 'Initializing...', percent: 0 });

    try {
      setProgress({ message: inputMode === 'file' ? 'Uploading file...' : 'Encoding source...', percent: 10 });
      const source_b64 = inputMode === 'file' ? await fileToBase64(file as File) : stringToBase64(pastedSource);

      let filename: string;
      if (inputMode === 'file') {
        filename = (file as File).name;
      } else {
        const lang = detectLanguage('pasted_source', pastedSource);
        setDetectedLanguage(lang);
        filename = lang === 'cpp' ? 'pasted_source.cpp' : 'pasted_source.c';
      }

      // Build compiler flags based on layers
      const flags: string[] = [...selectedFlags];
      if (layer1) {
        flags.push('-flto', '-fvisibility=hidden', '-O3', '-fno-builtin',
                   '-flto=thin', '-fomit-frame-pointer', '-mspeculative-load-hardening', '-O1');
      }
      if (layer2) {
        flags.push('-mllvm', '-fla', '-mllvm', '-bcf', '-mllvm', '-sub', '-mllvm', '-split');
      }

      const payload = {
        source_code: source_b64,
        filename: filename,
        config: {
          level: obfuscationLevel,
          passes: {
            flattening: layer2,
            substitution: layer2,
            bogus_control_flow: layer2,
            split: layer2
          },
          cycles: cycles,
          target_platform: targetPlatform,
          string_encryption: layer3,
          fake_loops: layer3 ? fakeLoops : 0,
          symbol_obfuscation: {
            enabled: layer0,
            algorithm: symbolAlgorithm,
            hash_length: symbolHashLength,
            prefix_style: symbolPrefix,
            salt: symbolSalt || null
          }
        },
        report_formats: ['json'],
        custom_flags: Array.from(new Set(flags.flatMap(f => f.split(' ')).map(t => t.trim()).filter(t => t.length > 0)))
      };

      setProgress({ message: 'Processing obfuscation...', percent: 30 });

      const res = await fetch('/api/obfuscate/sync', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload)
      });

      if (!res.ok) {
        const errorText = await res.text();
        throw new Error(errorText);
      }

      setProgress({ message: 'Finalizing...', percent: 90 });
      const data = await res.json();
      setJobId(data.job_id);
      setDownloadUrls({
        [targetPlatform]: data.download_url,
        linux: targetPlatform === 'linux' ? data.download_url : null,
        windows: targetPlatform === 'windows' ? data.download_url : null,
        macos: targetPlatform === 'macos' ? data.download_url : null
      });
      setBinaryName(data.binary_name);
      setProgress({ message: 'Complete!', percent: 100 });
      setToast(`✓ Obfuscation completed! Binary ready for download.`);
      setTimeout(() => setToast(null), 5000);

      // Auto-fetch report
      if (data.report_url) {
        const reportRes = await fetch(data.report_url);
        if (reportRes.ok) {
          const reportData = await reportRes.json();
          setReport(reportData);
        }
      }
    } catch (err) {
      setProgress(null);
      setToast(`✗ Error: ${String(err)}`);
      setTimeout(() => setToast(null), 5000);
    } finally {
      setLoading(false);
      setTimeout(() => setProgress(null), 2000);
    }
  }, [
    file, inputMode, pastedSource, selectedFlags, obfuscationLevel, cycles, targetPlatform,
    layer0, layer1, layer2, layer3, layer4, fakeLoops,
    symbolAlgorithm, symbolHashLength, symbolPrefix, symbolSalt, detectLanguage
  ]);

  const onDownloadBinary = useCallback((platform: Platform) => {
    const url = downloadUrls[platform];
    if (!url) return;
    const link = document.createElement('a');
    link.href = url;
    link.download = binaryName || `obfuscated_${platform}`;
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  }, [downloadUrls, binaryName]);

  return (
    <div className="container">
      {/* Header */}
      <header className="header">
        <div className="header-content">
          <h1 className="title">LLVM-OBFUSCATOR</h1>
          <button className="dark-toggle" onClick={() => setDarkMode(!darkMode)}>
            {darkMode ? '☀' : '☾'}
          </button>
        </div>
        <div className="status-bar">
          <span className={`status-indicator ${serverStatus}`}>
            [{serverStatus === 'online' ? '✓' : serverStatus === 'offline' ? '✗' : '...'}] Backend: {serverStatus}
          </span>
          {detectedLanguage && <span className="lang-indicator">[{detectedLanguage.toUpperCase()}]</span>}
        </div>
      </header>

      {toast && <div className="toast">{toast}</div>}

      <main className="main-content">
        {/* Input Section */}
        <section className="section">
          <h2 className="section-title">[1] SOURCE INPUT</h2>
          <div className="input-mode-toggle">
            <button
              className={inputMode === 'file' ? 'active' : ''}
              onClick={() => setInputMode('file')}
            >
              FILE
            </button>
            <button
              className={inputMode === 'paste' ? 'active' : ''}
              onClick={() => setInputMode('paste')}
            >
              PASTE
            </button>
          </div>

          {inputMode === 'file' ? (
            <div className="file-input">
              <label className="file-label">
                <input type="file" accept=".c,.cpp,.cc,.cxx,.txt" onChange={onPick} />
                SELECT FILE
              </label>
              {file && <span className="file-name">{file.name}</span>}
            </div>
          ) : (
            <textarea
              className="code-input"
              placeholder="// Paste your C/C++ source code here..."
              value={pastedSource}
              onChange={(e) => setPastedSource(e.target.value)}
              rows={12}
            />
          )}
        </section>

        {/* Layer Selection */}
        <section className="section">
          <h2 className="section-title">[2] OBFUSCATION LAYERS</h2>
          <div className="layer-description">
            Layers are cascading: selecting Layer N enables all layers 0 to N
          </div>
          <div className="layers-grid">
            <label className="layer-checkbox">
              <input
                type="checkbox"
                checked={layer0}
                onChange={(e) => handleLayerChange(0, e.target.checked)}
              />
              <span className="layer-label">
                [LAYER 0] Symbol Obfuscation
                <small>Rename all functions/variables</small>
              </span>
            </label>

            <label className="layer-checkbox">
              <input
                type="checkbox"
                checked={layer1}
                onChange={(e) => handleLayerChange(1, e.target.checked)}
              />
              <span className="layer-label">
                [LAYER 1] Compiler Flags
                <small>9 optimal LLVM flags (82.5/100 score)</small>
              </span>
            </label>

            <label className="layer-checkbox">
              <input
                type="checkbox"
                checked={layer2}
                onChange={(e) => handleLayerChange(2, e.target.checked)}
              />
              <span className="layer-label">
                [LAYER 2] OLLVM Passes
                <small>4 passes: flatten, subst, bogus-cf, split</small>
              </span>
            </label>

            <label className="layer-checkbox">
              <input
                type="checkbox"
                checked={layer3}
                onChange={(e) => handleLayerChange(3, e.target.checked)}
              />
              <span className="layer-label">
                [LAYER 3] Targeted Obfuscation
                <small>String encryption + fake loops</small>
              </span>
            </label>

            <label className="layer-checkbox">
              <input
                type="checkbox"
                checked={layer4}
                onChange={(e) => handleLayerChange(4, e.target.checked)}
              />
              <span className="layer-label">
                [LAYER 4] VM Virtualization
                <small>Bytecode VM protection (high overhead)</small>
              </span>
            </label>
          </div>

          {layer3 && (
            <div className="layer-config">
              <label>
                Fake Loops:
                <input
                  type="number"
                  min="0"
                  max="50"
                  value={fakeLoops}
                  onChange={(e) => setFakeLoops(parseInt(e.target.value) || 0)}
                />
              </label>
            </div>
          )}

          {layer0 && (
            <div className="layer-config">
              <label>
                Algorithm:
                <select value={symbolAlgorithm} onChange={(e) => setSymbolAlgorithm(e.target.value)}>
                  <option value="sha256">SHA256</option>
                  <option value="blake2b">BLAKE2B</option>
                  <option value="siphash">SipHash</option>
                </select>
              </label>
              <label>
                Hash Length:
                <input
                  type="number"
                  min="8"
                  max="32"
                  value={symbolHashLength}
                  onChange={(e) => setSymbolHashLength(parseInt(e.target.value) || 12)}
                />
              </label>
              <label>
                Prefix:
                <select value={symbolPrefix} onChange={(e) => setSymbolPrefix(e.target.value)}>
                  <option value="none">none</option>
                  <option value="typed">typed (f_, v_)</option>
                  <option value="underscore">underscore (_)</option>
                </select>
              </label>
            </div>
          )}
        </section>

        {/* Configuration */}
        <section className="section">
          <h2 className="section-title">[3] CONFIGURATION</h2>
          <div className="config-grid">
            <label>
              Level:
              <select
                value={obfuscationLevel}
                onChange={(e) => setObfuscationLevel(parseInt(e.target.value))}
              >
                <option value="1">1 - Minimal</option>
                <option value="2">2 - Low</option>
                <option value="3">3 - Medium</option>
                <option value="4">4 - High</option>
                <option value="5">5 - Maximum</option>
              </select>
            </label>

            <label>
              Cycles:
              <input
                type="number"
                min="1"
                max="5"
                value={cycles}
                onChange={(e) => setCycles(parseInt(e.target.value) || 1)}
              />
            </label>

            <label>
              Platform:
              <select
                value={targetPlatform}
                onChange={(e) => setTargetPlatform(e.target.value as Platform)}
              >
                <option value="linux">Linux</option>
                <option value="windows">Windows</option>
                <option value="macos">macOS</option>
              </select>
            </label>
          </div>
        </section>

        {/* Submit */}
        <section className="section">
          <h2 className="section-title">[4] EXECUTE</h2>
          <button
            className="submit-btn"
            onClick={onSubmit}
            disabled={loading || (inputMode === 'file' ? !file : pastedSource.trim().length === 0)}
          >
            {loading ? 'PROCESSING...' : '► OBFUSCATE'}
          </button>

          {progress && (
            <div className="progress-container">
              <div className="progress-bar">
                <div className="progress-fill" style={{ width: `${progress.percent}%` }} />
              </div>
              <div className="progress-text">{progress.message} ({progress.percent}%)</div>
            </div>
          )}

          {downloadUrls[targetPlatform] && (
            <div className="download-section">
              <h3>Download Obfuscated Binary:</h3>
              <div className="download-buttons">
                {(Object.keys(downloadUrls) as Platform[]).map(platform => (
                  downloadUrls[platform] && (
                    <button
                      key={platform}
                      className="download-btn"
                      onClick={() => onDownloadBinary(platform)}
                    >
                      ⬇ {platform.toUpperCase()}
                    </button>
                  )
                ))}
              </div>
              {binaryName && <div className="binary-name">File: {binaryName}</div>}
            </div>
          )}
        </section>

        {/* Report */}
        {report && (
          <section className="section report-section">
            <h2 className="section-title">[5] OBFUSCATION REPORT</h2>

            <div className="report-grid">
              {/* Input Parameters */}
              <div className="report-block">
                <h3>INPUT PARAMETERS</h3>
                <div className="report-item">Source: {report.source_file}</div>
                <div className="report-item">Platform: {report.platform}</div>
                <div className="report-item">Level: {report.obfuscation_level}</div>
                <div className="report-item">Timestamp: {report.timestamp}</div>
                <div className="report-item">Compiler Flags: {report.compiler_flags.join(' ')}</div>
              </div>

              {/* Output Attributes */}
              <div className="report-block">
                <h3>OUTPUT ATTRIBUTES</h3>
                <div className="report-item">Size: {(report.output_attributes.file_size / 1024).toFixed(2)} KB</div>
                <div className="report-item">Format: {report.output_attributes.binary_format}</div>
                <div className="report-item">Symbols: {report.output_attributes.symbols_count}</div>
                <div className="report-item">Functions: {report.output_attributes.functions_count}</div>
                <div className="report-item">Entropy: {report.output_attributes.entropy.toFixed(3)}</div>
                <div className="report-item">Methods: {report.output_attributes.obfuscation_methods.join(', ')}</div>
              </div>

              {/* Bogus Code */}
              <div className="report-block">
                <h3>BOGUS CODE GENERATION</h3>
                <div className="report-item">Dead Blocks: {report.bogus_code_info.dead_code_blocks}</div>
                <div className="report-item">Opaque Predicates: {report.bogus_code_info.opaque_predicates}</div>
                <div className="report-item">Junk Instructions: {report.bogus_code_info.junk_instructions}</div>
                <div className="report-item">Code Bloat: {report.bogus_code_info.code_bloat_percentage}%</div>
              </div>

              {/* Cycles */}
              <div className="report-block">
                <h3>OBFUSCATION CYCLES</h3>
                <div className="report-item">Total: {report.cycles_completed.total_cycles}</div>
                {report.cycles_completed.per_cycle_metrics.map(cycle => (
                  <div key={cycle.cycle} className="report-item">
                    Cycle {cycle.cycle}: {cycle.passes_applied.join(', ')} ({cycle.duration_ms}ms)
                  </div>
                ))}
              </div>

              {/* String Obfuscation */}
              <div className="report-block">
                <h3>STRING ENCRYPTION</h3>
                <div className="report-item">Total Strings: {report.string_obfuscation.total_strings}</div>
                <div className="report-item">Encrypted: {report.string_obfuscation.encrypted_strings}</div>
                <div className="report-item">Method: {report.string_obfuscation.encryption_method}</div>
                <div className="report-item">Rate: {report.string_obfuscation.encryption_percentage.toFixed(1)}%</div>
              </div>

              {/* Fake Loops */}
              <div className="report-block">
                <h3>FAKE LOOPS</h3>
                <div className="report-item">Count: {report.fake_loops_inserted.count}</div>
                {report.fake_loops_inserted.locations.length > 0 && (
                  <div className="report-item">Locations: {report.fake_loops_inserted.locations.join(', ')}</div>
                )}
              </div>

              {/* Symbol Obfuscation */}
              <div className="report-block">
                <h3>SYMBOL OBFUSCATION</h3>
                <div className="report-item">Enabled: {report.symbol_obfuscation.enabled ? 'Yes' : 'No'}</div>
                {report.symbol_obfuscation.enabled && report.symbol_obfuscation.symbols_obfuscated && (
                  <>
                    <div className="report-item">Symbols Renamed: {report.symbol_obfuscation.symbols_obfuscated}</div>
                    <div className="report-item">Algorithm: {report.symbol_obfuscation.algorithm}</div>
                  </>
                )}
              </div>

              {/* Metrics */}
              <div className="report-block">
                <h3>EFFECTIVENESS METRICS</h3>
                <div className="report-item">Obfuscation Score: {report.obfuscation_score}/100</div>
                <div className="report-item">Symbol Reduction: {report.symbol_reduction}%</div>
                <div className="report-item">Function Reduction: {report.function_reduction}%</div>
                <div className="report-item">Size Change: {report.size_reduction > 0 ? '+' : ''}{report.size_reduction}%</div>
                <div className="report-item">Entropy Increase: {report.entropy_increase}%</div>
                <div className="report-item">Est. RE Effort: {report.estimated_re_effort}</div>
              </div>
            </div>
          </section>
        )}
      </main>

      <footer className="footer">
        <p>LLVM-OBFUSCATOR :: Research-backed binary hardening</p>
      </footer>
    </div>
  );
}

export default App;
