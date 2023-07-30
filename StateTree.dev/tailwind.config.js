/** @type {import('tailwindcss').Config} */

const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './src/**/*.{js,jsx,ts,tsx}',
  ],
  theme: {
    fontFamily: {
      'mono': ['Berkeley Mono', ...defaultTheme.fontFamily.mono],
    },
    extend: {},
  },
  plugins: [],
}
