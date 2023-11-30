import resolve from "@rollup/plugin-node-resolve"
import svelte from 'rollup-plugin-svelte';
import css from 'rollup-plugin-css-only';

export default {
  input: "app/javascript/application.js",
  output: {
    file: "app/assets/builds/application.js",
    format: "iife",
    sourcemap: true
  },
  plugins: [
    svelte({
      // Tell the svelte plugin where our svelte files are located
      include: 'app/javascript/components/**/*.svelte',
    }),
    css({output: 'rollup.css'}),
    // Tell any third-party plugins that we're building for the browser
    resolve({ browser: true }),
  ],
}
