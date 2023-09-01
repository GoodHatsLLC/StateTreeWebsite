// @ts-check
// Note: type annotations allow type checking and IDEs autocompletion

const lightCodeTheme = require('prism-react-renderer/themes/github');
const darkCodeTheme = require('prism-react-renderer/themes/dracula');

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: 'StateTree',
  tagline: 'Model your domain, not its UI',
  favicon: 'img/favicon.ico',
  url: 'https://statetree.dev',
  baseUrl: '/',

  // GitHub pages deployment config.
  // If you aren't using GitHub pages, you don't need these.
  organizationName: 'GoodHatsLLC', // Usually your GitHub org/user name.
  projectName: 'StateTreeWebsite', // Usually your repo name.

  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',

  // Even if you don't use internalization, you can use this field to set useful
  // metadata like html lang. For example, if your site is Chinese, you may want
  // to replace "en" with "zh-Hans".
  i18n: {
    defaultLocale: 'en',
    locales: ['en'],
  },
  customFields: {
    description: 'StateTree is a reactive domain modelling library for writing API oriented app domain logic — everything in an app except the UI. It provides the developer tooling and state management you expect from a modern UI framework like SwiftUI, but free from the proprietary and special-purpose APIs which make UI code complicated and hard to test. It includes UI integration shims allowing you to simply and easily write a pure UI layer for a StateTree application.',
  },
  plugins: [
            async function myPlugin(context, options) {
              return {
                name: "docusaurus-tailwindcss",
                configurePostCss(postcssOptions) {
          // Appends TailwindCSS and AutoPrefixer.
                  postcssOptions.plugins.push(require("tailwindcss"));
                  postcssOptions.plugins.push(require("autoprefixer"));
                  return postcssOptions;
                },
              };
            },
            ],
  presets: [
            [
             'classic',
      /** @type {import('@docusaurus/preset-classic').Options} */
             ({
              docs: {
                sidebarPath: require.resolve('./sidebars.js'),
          // editUrl: 'https://github.com/facebook/docusaurus/tree/main/packages/create-docusaurus/templates/shared/',
              },
              blog: {
                showReadingTime: true,
          // editUrl: 'https://github.com/facebook/docusaurus/tree/main/packages/create-docusaurus/templates/shared/',
              },
              theme: {
                customCss: require.resolve('./src/css/custom.css'),
              },
            }),
             ],
            ],
  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
  ({
      // Replace with your project's social card
    image: 'img/statetree.webp',
    navbar: {
      title: 'StateTree',
      logo: {
        alt: 'StateTree Logo',
        src: 'img/statetree.webp',
      },
      items: [
      {
        type: 'docSidebar',
        sidebarId: 'tutorialSidebar',
        position: 'left',
        label: 'Documentation',
      },
      {to: '/blog', label: 'Blog', position: 'left'},
      {to: '/api/documentation', label: 'API Reference', position: 'left'},
      {
        href: 'https://github.com/GoodHatsLLC/StateTree',
        label: 'GitHub',
        position: 'right',
      },
      ],
    },
    footer: {
      style: 'dark',
      links: [
      {
        title: 'Documentation',
        items: [
        {
          label: 'Introduction',
          to: '/docs/intro',
        },
        ],
      },
      {
        title: 'API Reference',
        items: [
        {
          label: 'Apple Docs',
          href: '/api/documentation',
        }
        ],
      },
      {
        title: 'Repo',
        items: [
        {
          label: 'GitHub',
          href: 'https://github.com/GoodHatsLLC/StateTree',
        },
        ],
      },
      ],
      copyright: `Copyright © ${new Date().getFullYear()} Good Hats, LLC.`,
    },
    prism: {
      theme: lightCodeTheme,
      darkTheme: darkCodeTheme,
    },
    colorMode: {
      defaultMode: 'light',
      disableSwitch: true,
      respectPrefersColorScheme: true,
    },
  }),
};

module.exports = config;
