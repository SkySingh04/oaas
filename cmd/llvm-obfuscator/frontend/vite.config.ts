import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  server: {
    port: 4666,
    host: '0.0.0.0',
    strictPort: true,
    proxy: {
      '/api': {
        target: 'http://llvm-obfuscator-backend:8000',
        changeOrigin: true,
        secure: false
      },
      '/ws': {
        target: 'ws://llvm-obfuscator-backend:8000',
        ws: true,
        changeOrigin: true
      }
    }
  },
  preview: {
    port: 4666,
    host: '0.0.0.0',
    strictPort: true,
    proxy: {
      '/api': {
        target: 'http://llvm-obfuscator-backend:8000',
        changeOrigin: true,
        secure: false
      },
      '/ws': {
        target: 'ws://llvm-obfuscator-backend:8000',
        ws: true,
        changeOrigin: true
      }
    }
  }
});
