import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import * as path from 'path';

// Vite configuration for the Netflix clone.  This sets up the React plugin
// and defines an alias for the src directory so that imports like '@/components/...'
// resolve correctly.  Additional configuration options can be added as needed.
export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, 'src'),
    },
  },
  server: {
    port: 5173,
  },
});