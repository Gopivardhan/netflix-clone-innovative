import { defineConfig } from 'cypress';

export default defineConfig({
  e2e: {
    baseUrl: 'http://localhost:5173',
    video: false,
    setupNodeEvents() {
      // implement node event listeners here
    },
  },
});