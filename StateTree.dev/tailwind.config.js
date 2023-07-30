/** @type {import('tailwindcss').Config} */

const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './src/**/*.{js,jsx,ts,tsx}',
  ],
  theme: {
    fontFamily: {
      'sans': ['Inter', ...defaultTheme.fontFamily.sans],
      'serif': ['Baskerville', 'Libre Baskerville', ...defaultTheme.fontFamily.serif],
      'mono': ['Berkeley Mono', 'IBMPlexMono', ...defaultTheme.fontFamily.mono],
    },
    extend: {},
  },
  plugins: [],
}
