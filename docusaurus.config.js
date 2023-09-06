// @ts-check

const lightCodeTheme = require("prism-react-renderer/themes/github");
const darkCodeTheme = require("prism-react-renderer/themes/dracula");

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: "StateTree",
  tagline: "Model your domain, not its UI",
  favicon: "img/favicon.ico",
  url: "https://statetree.dev",
  baseUrl: "/",
  organizationName: "GoodHatsLLC",
  projectName: "StateTreeWebsite",
  deploymentBranch: "gh-pages",
  trailingSlash: false,
  onBrokenLinks: "throw",
  onBrokenMarkdownLinks: "warn",
  i18n: {
    defaultLocale: "en",
    locales: ["en"],
  },
  customFields: {
    description:
      "StateTree is a reactive domain modelling library for writing API oriented app domain logic.",
  },
  plugins: [
    async (context, options) => {
      return {
        name: "docusaurus-tailwindcss",
        configurePostCss(opt) {
          opt.plugins.push(require("tailwindcss"));
          opt.plugins.push(require("autoprefixer"));
          return opt;
        },
      };
    },
  ],
  presets: [
    [
      "classic",
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: {
          sidebarPath: require.resolve("./sidebars.js"),
        },
        blog: {
          showReadingTime: true,
        },
        theme: {
          customCss: require.resolve("./src/css/custom.css"),
        },
      }),
    ],
  ],
  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      image: "img/statetree.webp",
      navbar: {
        title: "StateTree",
        logo: {
          alt: "StateTree Logo",
          src: "img/statetree.webp",
        },
        items: [
          {
            type: "docSidebar",
            sidebarId: "tutorialSidebar",
            position: "left",
            label: "Documentation",
          },
          {
            to: "/blog",
            label: "Blog",
            position: "left",
          },
          {
            href: "https://docs.statetree.dev/documentation/statetree",
            label: "API Reference",
            position: "left",
          },
          {
            href: "https://github.com/GoodHatsLLC/StateTree",
            label: "GitHub",
            position: "right",
          },
        ],
      },
      footer: {
        style: "dark",
        links: [
          {
            title: "Documentation",
            items: [
              {
                label: "Introduction",
                to: "/docs/intro",
              },
            ],
          },
          {
            title: "API Reference",
            items: [
              {
                label: "Apple Docs",
                href: "https://docs.statetree.dev/documentation/statetree",
              },
            ],
          },
          {
            title: "Repo",
            items: [
              {
                label: "GitHub",
                href: "https://github.com/GoodHatsLLC/StateTree",
              },
            ],
          },
        ],
        copyright: `Copyright © ${new Date().getFullYear()} Good Hats, LLC.<br />🧢`,
      },
      prism: {
        theme: lightCodeTheme,
        darkTheme: darkCodeTheme,
      },
      colorMode: {
        defaultMode: "light",
        disableSwitch: true,
        respectPrefersColorScheme: true,
      },
    }),
};

module.exports = config;
