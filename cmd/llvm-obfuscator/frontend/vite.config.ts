import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import type { ServerOptions as HttpsServerOptions } from 'node:https';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const certDir = path.resolve(__dirname, 'certs');
const devKey = path.join(certDir, 'dev.key');
const devCert = path.join(certDir, 'dev.crt');

function resolveHttps(): HttpsServerOptions | undefined {
  if (process.env.VITE_DISABLE_HTTPS === 'true') {
    return undefined;
  }

  if (fs.existsSync(devKey) && fs.existsSync(devCert)) {
    return {
      key: fs.readFileSync(devKey),
      cert: fs.readFileSync(devCert)
    };
  }

  return undefined;
}

export default defineConfig({
  plugins: [react()],
  server: {
    port: 5173,
    host: true,
    https: resolveHttps(),
    proxy: {
      '/api': 'http://localhost:8000',
      '/ws': {
        target: 'ws://localhost:8000',
        ws: true
      }
    }
  }
});
