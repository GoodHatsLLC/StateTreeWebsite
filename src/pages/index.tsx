import React from 'react';
import clsx from 'clsx';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import Layout from '@theme/Layout';
import HomepageFeatures from '@site/src/components/HomepageFeatures';
import treeLogo from '@site/static/img/statetree.webp';
import styles from './index.module.css';

console.log(treeLogo)

function HomepageHeader() {
  const {siteConfig} = useDocusaurusContext();
  return (
    <header className="h-4 bg-no-repeat bg-origin-content p-3 bg-contain bg-center grid grid-rows-5 grid-flow-col gap-0 h-60 justify-center items-stretch" style={{backgroundImage: `url(${treeLogo}`}}>
      <div className="row-start-4 row-span-2 text-center">
        <h1 className="text-6xl text-tan-100 font-mono font-bold mb-1" style={{textShadow: "black 0.1rem 0.1rem 1.5rem"}}>{siteConfig.title}</h1>
        <p className="inline text-lg font-bold text-white font-serif backdrop-blur-sm bg-red/70 py-1 px-2 m-0 rounded">Model your domain – not just its UI</p>
      </div>
    </header>
  );
}

export default function Home(): JSX.Element {
  const {siteConfig} = useDocusaurusContext();
  return (
    <Layout
      title={`${siteConfig.title}`}
      description={`${siteConfig.customFields.description}`}>
      <HomepageHeader />
      <main>
        <HomepageFeatures />
      </main>
    </Layout>
  );
}
