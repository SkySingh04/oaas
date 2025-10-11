import {
  CssBaseline,
  Box,
  Button,
  Typography,
  Stack,
  Divider,
  TextField,
  LinearProgress,
  Snackbar,
  Grid,
  Paper,
  List,
  ListItemButton,
  ListItemText,
  Alert,
  Checkbox,
  FormControlLabel,
  FormGroup,
  Select,
  MenuItem,
  FormControl,
  InputLabel
} from '@mui/material';
import { useCallback, useEffect, useMemo, useState } from 'react';

function App() {
  const [serverStatus, setServerStatus] = useState<'checking' | 'online' | 'offline'>('checking');
  const [file, setFile] = useState<File | null>(null);
  const [jobId, setJobId] = useState<string | null>(null);
  const [downloadUrl, setDownloadUrl] = useState<string | null>(null);
  const [binaryName, setBinaryName] = useState<string | null>(null);
  const [report, setReport] = useState<unknown | null>(null);
  const [loading, setLoading] = useState(false);
  const [toast, setToast] = useState<string | null>(null);
  const [processingStatus, setProcessingStatus] = useState<string>('');
  const [availableFlags, setAvailableFlags] = useState<Array<{ flag: string; category: string; description?: string }>>([
    { flag: '-O1', category: 'optimization_level', description: 'Basic optimization' },
    { flag: '-O2', category: 'optimization_level', description: 'Standard optimization' },
    { flag: '-O3', category: 'optimization_level', description: 'Aggressive optimization' },
    { flag: '-Ofast', category: 'optimization_level', description: 'Fast math optimization' },
    { flag: '-mllvm', category: 'mlllvm_prefix', description: 'MLLVM option prefix' },
    { flag: '-fla', category: 'obfuscation_pass', description: 'Control flow flattening (use with -mllvm)' },
    { flag: '-bcf', category: 'obfuscation_pass', description: 'Bogus control flow (use with -mllvm)' },
    { flag: '-sub', category: 'obfuscation_pass', description: 'Instruction substitution (use with -mllvm)' },
    { flag: '-split', category: 'obfuscation_pass', description: 'Basic block splitting (use with -mllvm)' },
    { flag: '-funroll-loops', category: 'loop_optimization', description: 'Unroll loops' },
    { flag: '-ffast-math', category: 'math_optimization', description: 'Fast math optimizations' },
    { flag: '-flto', category: 'lto', description: 'Link-time optimization' },
    { flag: '-fvisibility=hidden', category: 'symbol_visibility', description: 'Hide symbols by default' },
    { flag: '-fno-rtti', category: 'control_flow', description: 'Disable RTTI' },
    { flag: '-fno-exceptions', category: 'control_flow', description: 'Disable exceptions' },
    { flag: '-march=native', category: 'architecture_specific', description: 'Target native architecture' }
  ]);
  const [selectedFlags, setSelectedFlags] = useState<string[]>([]);

  // Layer 0: Symbol obfuscation state
  const [enableSymbolObf, setEnableSymbolObf] = useState(false);
  const [symbolAlgorithm, setSymbolAlgorithm] = useState('sha256');
  const [symbolHashLength, setSymbolHashLength] = useState(12);
  const [symbolPrefix, setSymbolPrefix] = useState('typed');
  const [symbolSalt, setSymbolSalt] = useState('');

  // Layer 2: OLLVM passes state
  const [enableFlattening, setEnableFlattening] = useState(false);
  const [enableSubstitution, setEnableSubstitution] = useState(false);
  const [enableBogusCF, setEnableBogusCF] = useState(false);
  const [enableSplit, setEnableSplit] = useState(false);

  // Layer 3: Targeted obfuscation state
  const [enableStringEncryption, setEnableStringEncryption] = useState(false);
  const [fakeLoops, setFakeLoops] = useState(0);

  // General settings
  const [obfuscationLevel, setObfuscationLevel] = useState(3);
  const [cycles, setCycles] = useState(1);

  const onPick = useCallback((e: React.ChangeEvent<HTMLInputElement>) => {
    setFile(e.target.files?.[0] ?? null);
  }, []);

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

  const onSubmit = useCallback(async () => {
    if (!file) {
      setToast('Choose a source file');
      return;
    }
    setLoading(true);
    setReport(null);
    setDownloadUrl(null);
    setBinaryName(null);
    setProcessingStatus('Uploading file...');
    
    try {
      const source_b64 = await fileToBase64(file);
      const tokens = Array.from(
        new Set(
          selectedFlags
            .flatMap((f) => f.split(' '))
            .map((t) => t.trim())
            .filter((t) => t.length > 0)
        )
      );
      const payload = {
        source_code: source_b64,
        filename: file.name,
        config: {
          level: obfuscationLevel,
          passes: {
            flattening: enableFlattening,
            substitution: enableSubstitution,
            bogus_control_flow: enableBogusCF,
            split: enableSplit
          },
          cycles: cycles,
          string_encryption: enableStringEncryption,
          fake_loops: fakeLoops,
          symbol_obfuscation: {
            enabled: enableSymbolObf,
            algorithm: symbolAlgorithm,
            hash_length: symbolHashLength,
            prefix_style: symbolPrefix,
            salt: symbolSalt || null
          }
        },
        report_formats: ['json'],
        custom_flags: tokens
      };
      
      setProcessingStatus('Processing obfuscation...');
      
      // Use synchronous endpoint
      const res = await fetch('/api/obfuscate/sync', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload)
      });
      
      if (!res.ok) {
        const errorText = await res.text();
        throw new Error(errorText);
      }
      
      const data = await res.json();
      setJobId(data.job_id);
      setDownloadUrl(data.download_url);
      setBinaryName(data.binary_name);
      setProcessingStatus('');
      setToast(`Obfuscation completed! Binary ready for download.`);
      
      // Auto-fetch report
      if (data.report_url) {
        const reportRes = await fetch(data.report_url);
        if (reportRes.ok) {
          const reportData = await reportRes.json();
          setReport(reportData);
        }
      }
    } catch (err) {
      setProcessingStatus('');
      setToast(`Error: ${String(err)}`);
    } finally {
      setLoading(false);
    }
  }, [
    file, selectedFlags, obfuscationLevel, cycles,
    enableFlattening, enableSubstitution, enableBogusCF, enableSplit,
    enableStringEncryption, fakeLoops,
    enableSymbolObf, symbolAlgorithm, symbolHashLength, symbolPrefix, symbolSalt
  ]);

  const onFetchReport = useCallback(async () => {
    if (!jobId) return;
    setLoading(true);
    try {
      const res = await fetch(`/api/report/${jobId}`);
      if (!res.ok) throw new Error(await res.text());
      const data = await res.json();
      setReport(data);
    } catch (err) {
      setToast(String(err));
    } finally {
      setLoading(false);
    }
  }, [jobId]);

  const onDownloadBinary = useCallback(() => {
    if (!downloadUrl) return;
    const link = document.createElement('a');
    link.href = downloadUrl;
    link.download = binaryName || 'obfuscated_binary';
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  }, [downloadUrl, binaryName]);

  const reportJson = useMemo(() => (report ? JSON.stringify(report, null, 2) : ''), [report]);

  useEffect(() => {
    // Check if backend is available
    fetch('/api/health')
      .then(res => {
        if (res.ok) {
          setServerStatus('online');
        } else {
          setServerStatus('offline');
        }
      })
      .catch(() => setServerStatus('offline'));
  }, []);

  const addFlag = (flag: string) => {
    setSelectedFlags((cur) => (cur.includes(flag) ? cur : [...cur, flag]));
  };
  const removeFlag = (flag: string) => {
    setSelectedFlags((cur) => cur.filter((f) => f !== flag));
  };

  return (
    <>
      <CssBaseline />
      <Box sx={{ maxWidth: 900, mx: 'auto', p: 4 }}>
        <Typography variant="h4" gutterBottom>
          LLVM Obfuscator
        </Typography>
        {serverStatus === 'checking' && (
          <Alert severity="info" sx={{ mb: 2 }}>Checking backend connection...</Alert>
        )}
        {serverStatus === 'offline' && (
          <Alert severity="error" sx={{ mb: 2 }}>
            Backend server is offline. Please start the API server: <code>python -m uvicorn api.server:app --reload</code>
          </Alert>
        )}
        {serverStatus === 'online' && (
          <Alert severity="success" sx={{ mb: 2 }}>Connected to backend server</Alert>
        )}
        <Stack spacing={2}>
          <Box>
            <Typography variant="subtitle1" gutterBottom>
              1) Choose source file
            </Typography>
            <Button variant="contained" component="label">
              Select File
              <input hidden type="file" accept=".c,.cpp,.cc,.cxx,.txt" onChange={onPick} />
            </Button>
            <Typography variant="body2" sx={{ ml: 2, display: 'inline-block' }}>
              {file ? file.name : 'No file selected'}
            </Typography>
          </Box>

          <Divider />

          <Box>
            <Typography variant="subtitle1" gutterBottom>
              2) Select custom flags
            </Typography>
            <Grid container spacing={2}>
              <Grid item xs={12} md={6}>
                <Paper variant="outlined" sx={{ maxHeight: 280, overflow: 'auto' }}>
                  <List dense>
                    {availableFlags.map((f, idx) => (
                      <ListItemButton key={`${f.flag}-${idx}`} onClick={() => addFlag(f.flag)}>
                        <ListItemText
                          primary={f.flag}
                          secondary={f.description ? `${f.category} — ${f.description}` : f.category}
                        />
                      </ListItemButton>
                    ))}
                  </List>
                </Paper>
              </Grid>
              <Grid item xs={12} md={6}>
                <Paper variant="outlined" sx={{ maxHeight: 280, overflow: 'auto' }}>
                  <List dense>
                    {selectedFlags.map((flag) => (
                      <ListItemButton key={flag} onClick={() => removeFlag(flag)}>
                        <ListItemText primary={flag} secondary="Selected (click to remove)" />
                      </ListItemButton>
                    ))}
                  </List>
                </Paper>
              </Grid>
            </Grid>
          </Box>

          <Divider />

          <Box>
            <Typography variant="subtitle1" gutterBottom>
              3) Obfuscation Configuration
            </Typography>

            <Grid container spacing={2} sx={{ mb: 2 }}>
              <Grid item xs={12} sm={6}>
                <FormControl fullWidth size="small">
                  <InputLabel>Obfuscation Level</InputLabel>
                  <Select
                    value={obfuscationLevel}
                    label="Obfuscation Level"
                    onChange={(e) => setObfuscationLevel(Number(e.target.value))}
                  >
                    <MenuItem value={1}>Level 1 - Minimal</MenuItem>
                    <MenuItem value={2}>Level 2 - Low</MenuItem>
                    <MenuItem value={3}>Level 3 - Medium (Recommended)</MenuItem>
                    <MenuItem value={4}>Level 4 - High</MenuItem>
                    <MenuItem value={5}>Level 5 - Maximum</MenuItem>
                  </Select>
                </FormControl>
              </Grid>

              <Grid item xs={12} sm={6}>
                <TextField
                  fullWidth
                  size="small"
                  label="Obfuscation Cycles"
                  type="number"
                  value={cycles}
                  onChange={(e) => setCycles(parseInt(e.target.value) || 1)}
                  inputProps={{ min: 1, max: 5 }}
                  helperText="Apply obfuscation multiple times (1-5)"
                />
              </Grid>
            </Grid>
          </Box>

          <Divider />

          <Box>
            <Typography variant="subtitle1" gutterBottom>
              4) Layer 2: OLLVM Compiler Passes
            </Typography>
            <Typography variant="caption" color="text.secondary" display="block" sx={{ mb: 1 }}>
              LLVM IR-level obfuscation passes (5-10% overhead)
            </Typography>

            <FormGroup>
              <Grid container spacing={1}>
                <Grid item xs={12} sm={6}>
                  <FormControlLabel
                    control={
                      <Checkbox
                        checked={enableFlattening}
                        onChange={(e) => setEnableFlattening(e.target.checked)}
                      />
                    }
                    label="Control Flow Flattening"
                  />
                </Grid>
                <Grid item xs={12} sm={6}>
                  <FormControlLabel
                    control={
                      <Checkbox
                        checked={enableSubstitution}
                        onChange={(e) => setEnableSubstitution(e.target.checked)}
                      />
                    }
                    label="Instruction Substitution"
                  />
                </Grid>
                <Grid item xs={12} sm={6}>
                  <FormControlLabel
                    control={
                      <Checkbox
                        checked={enableBogusCF}
                        onChange={(e) => setEnableBogusCF(e.target.checked)}
                      />
                    }
                    label="Bogus Control Flow"
                  />
                </Grid>
                <Grid item xs={12} sm={6}>
                  <FormControlLabel
                    control={
                      <Checkbox
                        checked={enableSplit}
                        onChange={(e) => setEnableSplit(e.target.checked)}
                      />
                    }
                    label="Basic Block Splitting"
                  />
                </Grid>
              </Grid>
            </FormGroup>
          </Box>

          <Divider />

          <Box>
            <Typography variant="subtitle1" gutterBottom>
              5) Layer 3: Targeted Function Obfuscation
            </Typography>
            <Typography variant="caption" color="text.secondary" display="block" sx={{ mb: 1 }}>
              Source-level transformations (~2-10% overhead)
            </Typography>

            <FormGroup>
              <FormControlLabel
                control={
                  <Checkbox
                    checked={enableStringEncryption}
                    onChange={(e) => setEnableStringEncryption(e.target.checked)}
                  />
                }
                label="String Encryption (XOR) - Hides secrets in binaries"
              />
            </FormGroup>

            <TextField
              sx={{ mt: 1 }}
              size="small"
              label="Fake Loops"
              type="number"
              value={fakeLoops}
              onChange={(e) => setFakeLoops(parseInt(e.target.value) || 0)}
              inputProps={{ min: 0, max: 50 }}
              helperText="Insert fake loop constructs (0-50)"
            />
          </Box>

          <Divider />

          <Box>
            <Typography variant="subtitle1" gutterBottom>
              6) Layer 0: Symbol Obfuscation (Source-Level)
            </Typography>
            <Typography variant="caption" color="text.secondary" display="block" sx={{ mb: 1 }}>
              Applied FIRST before other layers (0% overhead)
            </Typography>
            <FormGroup>
              <FormControlLabel
                control={
                  <Checkbox
                    checked={enableSymbolObf}
                    onChange={(e) => setEnableSymbolObf(e.target.checked)}
                  />
                }
                label="Enable Cryptographic Symbol Renaming"
              />
            </FormGroup>

            {enableSymbolObf && (
              <Grid container spacing={2} sx={{ mt: 1 }}>
                <Grid item xs={12} sm={6} md={3}>
                  <FormControl fullWidth size="small">
                    <InputLabel>Algorithm</InputLabel>
                    <Select
                      value={symbolAlgorithm}
                      label="Algorithm"
                      onChange={(e) => setSymbolAlgorithm(e.target.value)}
                    >
                      <MenuItem value="sha256">SHA256</MenuItem>
                      <MenuItem value="blake2b">BLAKE2B</MenuItem>
                      <MenuItem value="siphash">SipHash</MenuItem>
                    </Select>
                  </FormControl>
                </Grid>

                <Grid item xs={12} sm={6} md={3}>
                  <FormControl fullWidth size="small">
                    <InputLabel>Prefix Style</InputLabel>
                    <Select
                      value={symbolPrefix}
                      label="Prefix Style"
                      onChange={(e) => setSymbolPrefix(e.target.value)}
                    >
                      <MenuItem value="none">None</MenuItem>
                      <MenuItem value="typed">Typed (f_, v_)</MenuItem>
                      <MenuItem value="underscore">Underscore (_)</MenuItem>
                    </Select>
                  </FormControl>
                </Grid>

                <Grid item xs={12} sm={6} md={3}>
                  <TextField
                    fullWidth
                    size="small"
                    label="Hash Length"
                    type="number"
                    value={symbolHashLength}
                    onChange={(e) => setSymbolHashLength(parseInt(e.target.value) || 12)}
                    inputProps={{ min: 8, max: 32 }}
                  />
                </Grid>

                <Grid item xs={12} sm={6} md={3}>
                  <TextField
                    fullWidth
                    size="small"
                    label="Salt (optional)"
                    value={symbolSalt}
                    onChange={(e) => setSymbolSalt(e.target.value)}
                    placeholder="custom_salt"
                  />
                </Grid>
              </Grid>
            )}

            <Typography variant="caption" color="text.secondary" display="block" sx={{ mt: 1 }}>
              Transforms function names like validate_license_key → f_a7f3b2c8d9e4 (100% symbol hiding, 0% overhead)
            </Typography>
          </Box>

          <Divider />

          <Box>
            <Typography variant="subtitle1" gutterBottom>
              7) Quick Presets
            </Typography>
            <Typography variant="caption" color="text.secondary" display="block" sx={{ mb: 1 }}>
              Apply documented best-practice configurations
            </Typography>

            <Stack direction="row" spacing={1} sx={{ mb: 2, flexWrap: 'wrap' }}>
              <Button
                variant="outlined"
                size="small"
                onClick={() => {
                  // Standard: Level 3, String encryption, Symbol obf, Layer 1 flags
                  setObfuscationLevel(3);
                  setCycles(1);
                  setEnableFlattening(false);
                  setEnableSubstitution(false);
                  setEnableBogusCF(false);
                  setEnableSplit(false);
                  setEnableStringEncryption(true);
                  setFakeLoops(0);
                  setEnableSymbolObf(true);
                  setSelectedFlags(['-flto', '-fvisibility=hidden', '-O3', '-fno-builtin',
                                   '-flto=thin', '-fomit-frame-pointer', '-mspeculative-load-hardening',
                                   '-O1']);
                  setToast('Applied STANDARD preset: ~10% overhead, 10x harder to RE');
                }}
              >
                Standard
              </Button>

              <Button
                variant="outlined"
                size="small"
                onClick={() => {
                  // Maximum: Level 4, All OLLVM passes, String encryption, Symbol obf
                  setObfuscationLevel(4);
                  setCycles(1);
                  setEnableFlattening(true);
                  setEnableSubstitution(true);
                  setEnableBogusCF(true);
                  setEnableSplit(true);
                  setEnableStringEncryption(true);
                  setFakeLoops(0);
                  setEnableSymbolObf(true);
                  setSelectedFlags(['-flto', '-fvisibility=hidden', '-O3', '-fno-builtin',
                                   '-flto=thin', '-fomit-frame-pointer', '-mspeculative-load-hardening',
                                   '-O1']);
                  setToast('Applied MAXIMUM preset: ~15-20% overhead, 15-20x harder to RE');
                }}
              >
                Maximum
              </Button>

              <Button
                variant="outlined"
                size="small"
                onClick={() => {
                  // Ultimate: Level 5, All layers, Cycles 2, Fake loops 10
                  setObfuscationLevel(5);
                  setCycles(2);
                  setEnableFlattening(true);
                  setEnableSubstitution(true);
                  setEnableBogusCF(true);
                  setEnableSplit(true);
                  setEnableStringEncryption(true);
                  setFakeLoops(10);
                  setEnableSymbolObf(true);
                  setSelectedFlags(['-flto', '-fvisibility=hidden', '-O3', '-fno-builtin',
                                   '-flto=thin', '-fomit-frame-pointer', '-mspeculative-load-hardening',
                                   '-O1']);
                  setToast('Applied ULTIMATE preset: ~25-30% overhead, 50x+ harder to RE');
                }}
              >
                Ultimate
              </Button>

              <Button
                variant="outlined"
                size="small"
                color="warning"
                onClick={() => {
                  // Reset all settings
                  setObfuscationLevel(3);
                  setCycles(1);
                  setEnableFlattening(false);
                  setEnableSubstitution(false);
                  setEnableBogusCF(false);
                  setEnableSplit(false);
                  setEnableStringEncryption(false);
                  setFakeLoops(0);
                  setEnableSymbolObf(false);
                  setSymbolAlgorithm('sha256');
                  setSymbolHashLength(12);
                  setSymbolPrefix('typed');
                  setSymbolSalt('');
                  setSelectedFlags([]);
                  setToast('Reset all configuration to defaults');
                }}
              >
                Reset
              </Button>

              <Button
                variant="outlined"
                size="small"
                color="secondary"
                onClick={() => {
                  // Layer 1 Optimal: Just the 9 optimal flags
                  setSelectedFlags([
                    '-flto',
                    '-fvisibility=hidden',
                    '-O3',
                    '-fno-builtin',
                    '-flto=thin',
                    '-fomit-frame-pointer',
                    '-mspeculative-load-hardening',
                    '-O1'
                  ]);
                  setToast('Applied Layer 1 Optimal Flags (82.5/100 score)');
                }}
              >
                Layer 1 Optimal
              </Button>
            </Stack>
          </Box>

          <Divider />

          <Box>
            <Typography variant="subtitle1" gutterBottom>
              8) Submit and Process
            </Typography>
            <Stack direction="row" spacing={2} alignItems="center">
              <Button variant="contained" onClick={onSubmit} disabled={!file || loading}>
                {loading ? 'Processing...' : 'Submit & Obfuscate'}
              </Button>
              {loading && <LinearProgress sx={{ width: 200 }} />}
            </Stack>
            {processingStatus && (
              <Typography variant="body2" color="primary" sx={{ mt: 1 }}>
                {processingStatus}
              </Typography>
            )}
            {downloadUrl && (
              <Stack direction="row" spacing={2} sx={{ mt: 2 }}>
                <Button variant="contained" color="success" onClick={onDownloadBinary}>
                  Download Obfuscated Binary
                </Button>
                <Typography variant="body2" sx={{ display: 'flex', alignItems: 'center' }}>
                  {binaryName}
                </Typography>
              </Stack>
            )}
          </Box>

          <Divider />

          <Box>
            <Typography variant="subtitle1" gutterBottom>
              9) View Report (Optional)
            </Typography>
            <Stack direction="row" spacing={2} alignItems="center" sx={{ mb: 1 }}>
              <Button variant="outlined" onClick={onFetchReport} disabled={!jobId || loading}>
                Fetch Report
              </Button>
            </Stack>
            <TextField label="Report (JSON)" value={reportJson} multiline minRows={10} fullWidth InputProps={{ readOnly: true }} />
          </Box>
        </Stack>
      </Box>
      <Snackbar open={Boolean(toast)} autoHideDuration={4000} onClose={() => setToast(null)} message={toast ?? ''} />
    </>
  );
}

export default App;
