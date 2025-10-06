# LLVM Obfuscator

End-to-end LLVM-based binary obfuscation toolkit featuring a Python CLI, FastAPI server, and React dashboard.

## Features

- Optimal LLVM compilation flags with configurable obfuscation levels (1-5)
- Custom OLLVM passes (flattening, substitution, bogus control flow, split)
- XOR-based string encryption and fake loop injection
- CLI, REST API, and web frontend workflows
- Batch processing (YAML), reporting in JSON/HTML/PDF
- WebSocket progress tracking and job registry
- Comprehensive pytest suite covering core, CLI, and API layers

## Quick Start

```bash
./setup.sh
```

The setup script verifies LLVM 22, copies the OLLVM plugin (if available), creates a Python virtualenv, installs dependencies, and runs the test suite.

Activate the environment afterwards:

```bash
source .venv/bin/activate
```

## CLI Usage

```bash
python -m cli.obfuscate compile examples/hello.c --output ./obfuscated \
  --platform linux --level 4 --enable-flattening --enable-substitution \
  --enable-bogus-cf --enable-split --cycles 2 --string-encryption --fake-loops 5

python -m cli.obfuscate analyze ./obfuscated/hello
python -m cli.obfuscate compare ./bin/original ./bin/obfuscated --output reports/compare.json
python -m cli.obfuscate batch config.yaml
```

Run `python -m cli.obfuscate --help` for full documentation.

## API Server

```bash
uvicorn api.server:app --reload
```

Default API key: `change-me` (override via `OBFUSCATOR_API_KEY`). Key endpoints:

- `POST /api/obfuscate` – enqueue obfuscation job (base64 source code)
- `GET /api/analyze/{job_id}` – fetch analysis for completed job
- `POST /api/compare` – compare original vs obfuscated binaries
- `GET /api/jobs` – list job summaries
- `GET /api/report/{job_id}?fmt=json|html|pdf` – download generated report
- `GET /api/health` – service status
- `WS /ws/jobs/{job_id}` – live job progress events

Rate limiting (10 req/min) and payload size checks (100 MB) are enforced.

## Frontend

A Vite + React dashboard lives under `frontend/`.

```bash
cd frontend
npm install
npm run dev   # HTTP by default → http://localhost:5173
# Or enable HTTPS (requires accepting self-signed cert)
# Vite will use certs in ./certs/dev.key and ./certs/dev.crt if present
npm run dev:https
```

The dev server runs over HTTP by default and proxies API/WebSocket traffic to `http://localhost:8000`. If your browser forces HTTPS for localhost, clear HSTS for `localhost:5173` or use `npm run dev:https`. Set `VITE_API_KEY` in `.env` to authenticate requests.

## Configuration

Sample batch/config file: `config.yaml` (see problem statement). Custom LLVM plugin path can be supplied via CLI/API using `--custom-pass-plugin` or `custom_pass_plugin`.

## Tests

```bash
pytest tests
```

The suite validates:

- Core obfuscation pipeline
- Report generation contents
- CLI command surface
- REST API job flow and comparisons

## Project Structure

Refer to inline comments within the repository tree for component responsibilities.
