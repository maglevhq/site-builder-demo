const defaultTheme = require('tailwindcss/defaultTheme')
const { execSync } = require("child_process");
const ncuikitPath = execSync("bundle show ncuikit").toString().trim();

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    `${ncuikitPath}/app/components/**/*.js`,
    `${ncuikitPath}/app/components/**/*.html.erb`,
    `${ncuikitPath}/app/components/**/*.rb`,
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        "ncuikit-primary": {
          light: "rgb(var(--color-primary-light) / <alpha-value>)",
          DEFAULT: "rgb(var(--color-primary) / <alpha-value>)",
        },
        "ncuikit-secondary": "var(--color-secondary)",
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
