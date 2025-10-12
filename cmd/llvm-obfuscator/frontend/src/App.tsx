import {
  CssBaseline,
  Box,
  Button,
  Typography,
  Stack,
  TextField,
  LinearProgress,
  Snackbar,
  Grid,
  Paper,
  Alert,
  Checkbox,
  FormControlLabel,
  FormGroup,
  Select,
  MenuItem,
  FormControl,
  InputLabel,
  ToggleButton,
  ToggleButtonGroup,
  Tooltip,
  List,
  ListItemButton,
  ListItemText
} from '@mui/material';
import { ReactNode, useCallback, useEffect, useMemo, useRef, useState } from 'react';

type LayerId = 'layer0' | 'layer1' | 'layer2' | 'layer3' | 'layer4';
type VmProfile = 'balanced' | 'maximum';

type LayerPreset = {
  id: LayerId;
  title: string;
  details: string[];
  flags: string[];
  toast: string;
  config: {
    symbolObf: {
      enabled: boolean;
      algorithm: string;
      hashLength: number;
      prefix: string;
      salt: string;
    };
    passes: {
      flattening: boolean;
      substitution: boolean;
      bogusControlFlow: boolean;
      split: boolean;
    };
    targeted: {
      stringEncryption: boolean;
      fakeLoops: number;
    };
    general: {
      level: number;
      cycles: number;
      targetPlatform: 'linux' | 'windows' | 'macos';
    };
    vm: {
      enabled: boolean;
      profile: VmProfile;
      functions: number;
    };
  };
};

function App() {
  const [serverStatus, setServerStatus] = useState<'checking' | 'online' | 'offline'>('checking');
  const [file, setFile] = useState<File | null>(null);
  const [inputMode, setInputMode] = useState<'file' | 'paste'>('file');
  const [pastedSource, setPastedSource] = useState('');
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
    { flag: '-fomit-frame-pointer', category: 'binary_hardening', description: 'Remove frame pointer for optimized stacks' },
    { flag: '-fno-builtin', category: 'binary_hardening', description: 'Disable builtin replacements' },
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

  // Layer 4: Virtual machine obfuscation state
  const [enableVmProtection, setEnableVmProtection] = useState(false);
  const [vmProfile, setVmProfile] = useState<VmProfile>('balanced');
  const [vmFunctionCount, setVmFunctionCount] = useState(1);

  // General settings
  const [obfuscationLevel, setObfuscationLevel] = useState(3);
  const [cycles, setCycles] = useState(1);
  const [targetPlatform, setTargetPlatform] = useState<'linux' | 'windows' | 'macos'>('linux');
  const [detectedLanguage, setDetectedLanguage] = useState<'c' | 'cpp' | null>(null);

  const layer1Flags = useMemo(
    () => [
      '-flto',
      '-fvisibility=hidden',
      '-O3',
      '-fno-builtin',
      '-flto=thin',
      '-fomit-frame-pointer',
      '-mspeculative-load-hardening',
      '-O1'
    ],
    []
  );
  const layer2PassFlags = useMemo(
    () => ['-mllvm -fla', '-mllvm -bcf', '-mllvm -sub', '-mllvm -split'],
    []
  );
  const layerPresets = useMemo<LayerPreset[]>(
    () => [
      {
        id: 'layer0',
        title: 'LAYER 0: Symbol Obfuscation (source-level)',
        details: [
          'Applied to: ALL FUNCTION/VARIABLE NAMES',
          'Security: Removes semantic meaning from symbols',
          'Overhead: ~0% (compile-time only)',
          'Tool: symbol-obfuscator/ (C++ with crypto hashing)'
        ],
        flags: [],
        toast: 'Applied Layer 0: Symbol obfuscation baseline',
        config: {
          symbolObf: {
            enabled: true,
            algorithm: 'sha256',
            hashLength: 12,
            prefix: 'typed',
            salt: ''
          },
          passes: {
            flattening: false,
            substitution: false,
            bogusControlFlow: false,
            split: false
          },
          targeted: {
            stringEncryption: false,
            fakeLoops: 0
          },
          general: {
            level: 3,
            cycles: 1,
            targetPlatform: 'linux'
          },
          vm: {
            enabled: false,
            profile: 'balanced',
            functions: 0
          }
        }
      },
      {
        id: 'layer1',
        title: 'LAYER 1: Modern LLVM Compiler Flags (9 flags)',
        details: [
          'Applied to: ENTIRE BINARY',
          'Score: 82.5/100 (EXCELLENT)',
          'Overhead: ~0-2%',
          'Research: 150,000+ combinations tested'
        ],
        flags: layer1Flags,
        toast: 'Applied Layers 0-1: Symbol obfuscation + modern flags',
        config: {
          symbolObf: {
            enabled: true,
            algorithm: 'sha256',
            hashLength: 12,
            prefix: 'typed',
            salt: ''
          },
          passes: {
            flattening: false,
            substitution: false,
            bogusControlFlow: false,
            split: false
          },
          targeted: {
            stringEncryption: false,
            fakeLoops: 0
          },
          general: {
            level: 3,
            cycles: 1,
            targetPlatform: 'linux'
          },
          vm: {
            enabled: false,
            profile: 'balanced',
            functions: 0
          }
        }
      },
      {
        id: 'layer2',
        title: 'LAYER 2: OLLVM Compiler Passes (4 passes)',
        details: [
          'Applied to: ENTIRE BINARY (LLVM IR level)',
          'Score: 63.9/100 (superseded by Layer 1)',
          'Overhead: ~5-10%',
          'Research: All 4 passes ported to LLVM 19'
        ],
        flags: [...layer1Flags, ...layer2PassFlags],
        toast: 'Applied Layers 0-2: Added OLLVM compiler passes',
        config: {
          symbolObf: {
            enabled: true,
            algorithm: 'sha256',
            hashLength: 12,
            prefix: 'typed',
            salt: ''
          },
          passes: {
            flattening: true,
            substitution: true,
            bogusControlFlow: true,
            split: true
          },
          targeted: {
            stringEncryption: false,
            fakeLoops: 0
          },
          general: {
            level: 3,
            cycles: 1,
            targetPlatform: 'linux'
          },
          vm: {
            enabled: false,
            profile: 'balanced',
            functions: 0
          }
        }
      },
      {
        id: 'layer3',
        title: 'LAYER 3: Targeted Function Obfuscation (4 sub-layers)',
        details: [
          'Applied to: 2-5 CRITICAL FUNCTIONS ONLY',
          'Security: 10-50x harder to reverse engineer',
          'Overhead: ~10% (level 3), 10-50x (level 4 with VM)',
          'Research: Source-level transformations with proof'
        ],
        flags: [...layer1Flags, ...layer2PassFlags],
        toast: 'Applied Layers 0-3: Enabled targeted obfuscation stack',
        config: {
          symbolObf: {
            enabled: true,
            algorithm: 'sha256',
            hashLength: 12,
            prefix: 'typed',
            salt: ''
          },
          passes: {
            flattening: true,
            substitution: true,
            bogusControlFlow: true,
            split: true
          },
          targeted: {
            stringEncryption: true,
            fakeLoops: 10
          },
          general: {
            level: 4,
            cycles: 2,
            targetPlatform: 'linux'
          },
          vm: {
            enabled: false,
            profile: 'balanced',
            functions: 1
          }
        }
      },
      {
        id: 'layer4',
        title: 'LAYER 4: Virtual Machine Obfuscation (Maximum)',
        details: [
          'Applied to: 1-2 MISSION-CRITICAL FUNCTIONS',
          'Security: Custom bytecode VM with dispatcher',
          'Overhead: ~25-60% on protected paths',
          'Includes: Layers 0-3 plus micro-VM virtualization'
        ],
        flags: [...layer1Flags, ...layer2PassFlags],
        toast: 'Applied Layers 0-4: Added VM virtualization layer',
        config: {
          symbolObf: {
            enabled: true,
            algorithm: 'sha256',
            hashLength: 12,
            prefix: 'typed',
            salt: ''
          },
          passes: {
            flattening: true,
            substitution: true,
            bogusControlFlow: true,
            split: true
          },
          targeted: {
            stringEncryption: true,
            fakeLoops: 20
          },
          general: {
            level: 5,
            cycles: 3,
            targetPlatform: 'linux'
          },
          vm: {
            enabled: true,
            profile: 'maximum',
            functions: 2
          }
        }
      }
    ],
    [layer1Flags, layer2PassFlags]
  );
  const [sectionVisibility, setSectionVisibility] = useState<Record<string, boolean>>({});
  const [activeLayerPreset, setActiveLayerPreset] = useState<LayerId | null>(null);
  const intersectionObserver = useRef<IntersectionObserver | null>(null);
  const sectionRefs = useRef<Record<string, HTMLDivElement | null>>({} as Record<string, HTMLDivElement | null>);

  // Auto-detect C vs C++ from filename or content
  const detectLanguage = useCallback((filename: string, content?: string): 'c' | 'cpp' => {
    // Check file extension first
    const ext = filename.toLowerCase().split('.').pop();
    if (ext === 'cpp' || ext === 'cc' || ext === 'cxx' || ext === 'c++') {
      return 'cpp';
    }
    if (ext === 'c') {
      return 'c';
    }

    // If no clear extension, try to detect from content
    if (content) {
      // C++ indicators
      const cppIndicators = [
        /\bclass\b/,
        /\bnamespace\b/,
        /\btemplate\s*</,
        /\bstd::/,
        /\b(public|private|protected):/,
        /#include\s*<(iostream|string|vector|map|algorithm)>/,
        /\bvirtual\b/,
        /\boperator\s*\(/
      ];

      if (cppIndicators.some(regex => regex.test(content))) {
        return 'cpp';
      }
    }

    // Default to C
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
    bytes.forEach((byte) => {
      binary += String.fromCharCode(byte);
    });
    return btoa(binary);
  };

  const onSubmit = useCallback(async () => {
    if (inputMode === 'file' && !file) {
      setToast('Choose a source file');
      return;
    }
    if (inputMode === 'paste' && pastedSource.trim().length === 0) {
      setToast('Paste source code before submitting');
      return;
    }
    setLoading(true);
    setReport(null);
    setDownloadUrl(null);
    setBinaryName(null);
    setProcessingStatus(inputMode === 'file' ? 'Uploading file...' : 'Preparing source...');

    try {
      const source_b64 = inputMode === 'file' ? await fileToBase64(file as File) : stringToBase64(pastedSource);

      // Auto-detect language for pasted code
      let filename: string;
      if (inputMode === 'file') {
        filename = (file as File).name;
      } else {
        const lang = detectLanguage('pasted_source', pastedSource);
        setDetectedLanguage(lang);
        filename = lang === 'cpp' ? 'pasted_source.cpp' : 'pasted_source.c';
      }

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
        filename: filename,
        config: {
          level: obfuscationLevel,
          passes: {
            flattening: enableFlattening,
            substitution: enableSubstitution,
            bogus_control_flow: enableBogusCF,
            split: enableSplit
          },
          cycles: cycles,
          target_platform: targetPlatform,
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
    file, inputMode, pastedSource, selectedFlags, obfuscationLevel, cycles, targetPlatform,
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

  const applyLayerPreset = useCallback(
    (layerId: LayerId) => {
      const targetIndex = layerPresets.findIndex((layer) => layer.id === layerId);
      const preset = layerPresets[targetIndex];
      if (!preset) {
        return;
      }

      setActiveLayerPreset(layerId);

      // Symbol obfuscation
      setEnableSymbolObf(preset.config.symbolObf.enabled);
      setSymbolAlgorithm(preset.config.symbolObf.algorithm);
      setSymbolHashLength(preset.config.symbolObf.hashLength);
      setSymbolPrefix(preset.config.symbolObf.prefix);
      setSymbolSalt(preset.config.symbolObf.salt);

      // Compiler flags
      setSelectedFlags([...preset.flags]);

      // OLLVM passes
      setEnableFlattening(preset.config.passes.flattening);
      setEnableSubstitution(preset.config.passes.substitution);
      setEnableBogusCF(preset.config.passes.bogusControlFlow);
      setEnableSplit(preset.config.passes.split);

      // Targeted obfuscation
      setEnableStringEncryption(preset.config.targeted.stringEncryption);
      setFakeLoops(preset.config.targeted.fakeLoops);

      // General configuration
      setObfuscationLevel(preset.config.general.level);
      setCycles(preset.config.general.cycles);
      setTargetPlatform(preset.config.general.targetPlatform);

      // VM virtualization
      setEnableVmProtection(preset.config.vm.enabled);
      setVmProfile(preset.config.vm.profile);
      setVmFunctionCount(preset.config.vm.functions);

      setToast(preset.toast);
    },
    [layerPresets]
  );

  const renderSection = (key: string, index: number, content: ReactNode) => {
    const isVisible = sectionVisibility[key] ?? false;
    return (
      <Box
        key={key}
        data-section={key}
        ref={(node: HTMLDivElement | null) => {
          if (node) {
            sectionRefs.current[key] = node;
            intersectionObserver.current?.observe(node);
          } else {
            const existing = sectionRefs.current[key];
            if (existing) {
              intersectionObserver.current?.unobserve(existing);
            }
            delete sectionRefs.current[key];
          }
        }}
        sx={{
          mb: 3,
          opacity: isVisible ? 1 : 0,
          transform: isVisible ? 'translateY(0)' : 'translateY(24px)',
          transition: 'opacity 0.5s ease, transform 0.5s ease',
          transitionDelay: isVisible ? `${index * 70}ms` : '0ms'
        }}
      >
        <Paper
          elevation={0}
          variant="outlined"
          sx={{
            px: { xs: 2, md: 3 },
            py: { xs: 2, md: 3 },
            borderRadius: 2
          }}
        >
          {content}
        </Paper>
      </Box>
    );
  };

  useEffect(() => {
    const handleIntersect: IntersectionObserverCallback = (entries) => {
      entries.forEach((entry) => {
        const sectionKey = entry.target.getAttribute('data-section');
        if (sectionKey && entry.isIntersecting) {
          setSectionVisibility((prev) =>
            prev[sectionKey]
              ? prev
              : {
                  ...prev,
                  [sectionKey]: true
                }
          );
          intersectionObserver.current?.unobserve(entry.target);
        }
      });
    };

    intersectionObserver.current = new IntersectionObserver(handleIntersect, {
      threshold: 0.25,
      rootMargin: '0px 0px -10% 0px'
    });

    Object.values(sectionRefs.current).forEach((node) => {
      if (node) {
        intersectionObserver.current?.observe(node);
      }
    });

    return () => {
      intersectionObserver.current?.disconnect();
      intersectionObserver.current = null;
    };
  }, []);

  return (
    <>
      <CssBaseline />
      <Box
        sx={{
          maxWidth: 1280,
          mx: 'auto',
          py: { xs: 4, md: 6 },
          px: { xs: 2, md: 4 }
        }}
      >
        <Paper
          elevation={0}
          variant="outlined"
          sx={{
            mb: 4,
            p: { xs: 3, md: 4 },
            borderRadius: 2
          }}
        >
          <Stack spacing={2}>
            <Typography variant="h3" sx={{ fontWeight: 700, letterSpacing: -0.5 }}>
              LLVM Obfuscator
            </Typography>
            <Typography variant="body1" color="text.secondary" sx={{ maxWidth: 640 }}>
              Harden your binaries across four research-backed layers. Upload a project, tune the knobs,
              and ship an obfuscated build in minutes.
            </Typography>
            <Stack spacing={1.5}>
              {serverStatus === 'checking' && (
                <Alert severity="info">Checking backend connection...</Alert>
              )}
              {serverStatus === 'offline' && (
                <Alert severity="error">
                  Backend server is offline. Start the API server:
                  <code> python -m uvicorn api.server:app --reload</code>
                </Alert>
              )}
              {serverStatus === 'online' && (
                <Alert severity="success">Connected to backend server</Alert>
              )}
            </Stack>
          </Stack>
        </Paper>
        <Grid container spacing={4} alignItems="flex-start">
          <Grid item xs={12} md={8}>
            <Stack spacing={2}>
              {renderSection('source-input', 0, (
                <>
                  <Typography variant="subtitle1" gutterBottom>
                    1) Choose source input
                  </Typography>
                  <ToggleButtonGroup
                    size="small"
                    value={inputMode}
                    exclusive
                    onChange={(_, next) => {
                      if (next) {
                        setInputMode(next);
                      }
                    }}
                    sx={{ mb: 2 }}
                  >
                    <ToggleButton value="file">Upload File</ToggleButton>
                    <ToggleButton value="paste">Paste Source</ToggleButton>
                  </ToggleButtonGroup>

                  {inputMode === 'file' ? (
                    <Stack spacing={1}>
                      <Stack direction="row" spacing={2} alignItems="center">
                        <Button variant="contained" component="label">
                          Select File
                          <input hidden type="file" accept=".c,.cpp,.cc,.cxx,.txt" onChange={onPick} />
                        </Button>
                        <Typography variant="body2">
                          {file ? file.name : 'No file selected'}
                        </Typography>
                      </Stack>
                      {detectedLanguage && (
                        <Alert severity="info" sx={{ py: 0.5 }}>
                          Detected language: <strong>{detectedLanguage.toUpperCase()}</strong>
                        </Alert>
                      )}
                    </Stack>
                  ) : (
                    <Stack spacing={1}>
                      <TextField
                        label="Paste source code"
                        placeholder="int secret() { return 42; }"
                        value={pastedSource}
                        onChange={(e) => setPastedSource(e.target.value)}
                        multiline
                        minRows={8}
                        fullWidth
                      />
                      {pastedSource && detectedLanguage && (
                        <Alert severity="info" sx={{ py: 0.5 }}>
                          Detected language: <strong>{detectedLanguage.toUpperCase()}</strong> (will be compiled as {detectedLanguage === 'cpp' ? 'pasted_source.cpp' : 'pasted_source.c'})
                        </Alert>
                      )}
                    </Stack>
                  )}
                </>
              ))}
              {renderSection('custom-flags', 1, (
                <>
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
                </>
              ))}
              {renderSection('configuration', 2, (
                <>
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

                    <Grid item xs={12} sm={6}>
                      <FormControl fullWidth size="small">
                        <InputLabel>Target Platform</InputLabel>
                        <Select
                          value={targetPlatform}
                          label="Target Platform"
                          onChange={(e) => setTargetPlatform(e.target.value as 'linux' | 'windows' | 'macos')}
                        >
                          <MenuItem value="linux">Linux</MenuItem>
                          <MenuItem value="windows">Windows</MenuItem>
                          <MenuItem value="macos">macOS</MenuItem>
                        </Select>
                      </FormControl>
                    </Grid>
                  </Grid>
                </>
              ))}
              {renderSection('ollvm', 3, (
                <>
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
                </>
              ))}
              {renderSection('targeted', 4, (
                <>
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
                </>
              ))}
              {renderSection('vm-layer', 5, (
                <>
                  <Typography variant="subtitle1" gutterBottom>
                    6) Layer 4: Virtual Machine Obfuscation
                  </Typography>
                  <Typography variant="caption" color="text.secondary" display="block" sx={{ mb: 1 }}>
                    Wrap 1-2 critical functions in a bytecode VM dispatcher (25-60% overhead on hot paths)
                  </Typography>

                  <FormGroup>
                    <FormControlLabel
                      control={
                        <Checkbox
                          checked={enableVmProtection}
                          onChange={(e) => setEnableVmProtection(e.target.checked)}
                        />
                      }
                      label="Enable VM virtualization for selected functions"
                    />
                  </FormGroup>

                  <Stack direction={{ xs: 'column', sm: 'row' }} spacing={2} sx={{ mt: 1 }}>
                    <ToggleButtonGroup
                      size="small"
                      value={vmProfile}
                      exclusive
                      onChange={(_, next) => {
                        if (next) {
                          setVmProfile(next);
                        }
                      }}
                    >
                      <ToggleButton value="balanced">Balanced</ToggleButton>
                      <ToggleButton value="maximum">Maximum</ToggleButton>
                    </ToggleButtonGroup>

                    <TextField
                      size="small"
                      label="Functions protected"
                      type="number"
                      value={vmFunctionCount}
                      onChange={(e) => {
                        const next = parseInt(e.target.value, 10);
                        setVmFunctionCount(Number.isNaN(next) ? 1 : Math.min(Math.max(next, 1), 5));
                      }}
                      inputProps={{ min: 1, max: 5 }}
                      helperText="Recommend 1-2 high-value targets"
                    />
                  </Stack>

                  <Typography variant="caption" color="text.secondary" display="block" sx={{ mt: 1 }}>
                    Emits a dispatcher + opcode handlers to execute protected logic, significantly increasing reverse-engineering difficulty.
                  </Typography>
                </>
              ))}
              {renderSection('symbols', 6, (
                <>
                  <Typography variant="subtitle1" gutterBottom>
                    7) Layer 0: Symbol Obfuscation (Source-Level)
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
                </>
              ))}
              {/* Preset buttons temporarily disabled */}
              {renderSection('submission', 7, (
                <>
                  <Typography variant="subtitle1" gutterBottom>
                    8) Submit and Process
                  </Typography>
                  <Stack direction="row" spacing={2} alignItems="center">
                    <Button
                      variant="contained"
                      onClick={onSubmit}
                      disabled={
                        loading || (inputMode === 'file' ? !file : pastedSource.trim().length === 0)
                      }
                    >
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
                </>
              ))}
              {renderSection('report', 8, (
                <>
                  <Typography variant="subtitle1" gutterBottom>
                    9) View Report (Optional)
                  </Typography>
                  <Stack direction="row" spacing={2} alignItems="center" sx={{ mb: 1 }}>
                    <Button variant="outlined" onClick={onFetchReport} disabled={!jobId || loading}>
                      Fetch Report
                    </Button>
                  </Stack>
                  <TextField
                    label="Report (JSON)"
                    value={reportJson}
                    multiline
                    minRows={10}
                    fullWidth
                    InputProps={{ readOnly: true }}
                  />
                </>
              ))}
            </Stack>
          </Grid>
          <Grid item xs={12} md={4}>
            <Stack
              spacing={2}
              sx={{
                position: { md: 'sticky' },
                top: { md: 24 }
              }}
            >
              <Paper elevation={0} variant="outlined" sx={{ p: 2, borderRadius: 2 }}>
                <Stack spacing={0.5}>
                  <Typography variant="h6" sx={{ fontWeight: 700 }}>
                    Layer Presets
                  </Typography>
                  <Typography variant="body2" color="text.secondary">
                    Apply curated stacks instantly or build your own on the left.
                  </Typography>
                </Stack>
              </Paper>

              <Stack spacing={1.25}>
                {layerPresets.map((layer) => {
                  const isActive = activeLayerPreset === layer.id;
                  return (
                    <Paper
                      key={layer.id}
                      elevation={0}
                      variant="outlined"
                      sx={{ p: 1.25, borderRadius: 2 }}
                    >
                      <Stack direction="row" alignItems="center" spacing={1}>
                        <Button
                          fullWidth
                          variant={isActive ? 'contained' : 'outlined'}
                          onClick={() => applyLayerPreset(layer.id)}
                          sx={{
                            justifyContent: 'flex-start',
                            textTransform: 'none',
                            fontWeight: 600
                          }}
                        >
                          {layer.title.split(':')[0].trim()}
                        </Button>
                        <Tooltip
                          arrow
                          placement="left"
                          title={
                            <Stack spacing={0.75}>
                              <Stack spacing={0.25}>
                                <Typography variant="subtitle2" sx={{ fontWeight: 600 }}>
                                  {layer.title}
                                </Typography>
                                {layer.details.map((detail) => (
                                  <Typography key={detail} variant="caption" display="block">
                                    {detail}
                                  </Typography>
                                ))}
                              </Stack>
                              <Stack spacing={0.25}>
                                <Typography variant="caption" sx={{ fontWeight: 600, textTransform: 'uppercase' }}>
                                  Compiler Flags
                                </Typography>
                                {layer.flags.length > 0 ? (
                                  layer.flags.map((flag) => (
                                    <Typography key={flag} variant="caption" display="block">
                                      {flag}
                                    </Typography>
                                  ))
                                ) : (
                                  <Typography variant="caption" color="text.secondary">
                                    No compiler flags required (configuration only)
                                  </Typography>
                                )}
                              </Stack>
                            </Stack>
                          }
                        >
                          <Box
                            sx={{
                              width: 26,
                              height: 26,
                              borderRadius: '50%',
                              border: '1px solid',
                              borderColor: isActive ? 'primary.main' : 'divider',
                              display: 'flex',
                              alignItems: 'center',
                              justifyContent: 'center',
                              fontWeight: 600,
                              fontSize: 12,
                              cursor: 'pointer'
                            }}
                          >
                            i
                          </Box>
                        </Tooltip>
                      </Stack>
                    </Paper>
                  );
                })}
              </Stack>
            </Stack>
          </Grid>
        </Grid>
      </Box>
      <Snackbar open={Boolean(toast)} autoHideDuration={4000} onClose={() => setToast(null)} message={toast ?? ''} />
    </>
  );
}

export default App;
