import resolve from "@rollup/plugin-node-resolve"
import dynamicImportVars from '@rollup/plugin-dynamic-import-vars';
import svelte from 'rollup-plugin-svelte';

export default {
  input: "app/javascript/application.js",
  output: {
    file: "app/assets/builds/application.js",
    format: "iife",
    inlineDynamicImports: true,
    sourcemap: true
  },
  plugins: [
    svelte({
      // Tell the svelte plugin where our svelte files are located
      include: 'app/javascript/components/**/*.svelte',
    }),
    dynamicImportVars({}),
    // Tell any third-party plugins that we're building for the browser
    resolve({ browser: true }),
  ],
}