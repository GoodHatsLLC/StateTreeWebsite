import React from 'react';
import clsx from 'clsx';
import styles from './styles.module.css';

type FeatureItem = {
  title: string;
  description: JSX.Element;
};

const FeatureList: FeatureItem[] = [
  {
    title: 'Easy to Learn',
    // Svg: require('@site/static/img/undraw_docusaurus_mountain.svg').default,
    description: (
      <>
        Modelled on <strong>SwiftUI</strong> and with a near 1:1 concept mapping,
        StateTree will have you up and running in no time. <strong>There's no Redux here</strong>.
      </>
    ),
  },
  {
    title: 'Top Tier Reactivity',
    // Svg: require('@site/static/img/undraw_docusaurus_react.svg').default,
    description: (
      <>
        StateTree frees the best-in-class reactive tooling patterns from UI.
        It is <strong>data driven</strong> and supports
        arbitrary <strong>deep linking</strong> and state replay <strong>by default</strong>.
      </>
    ),
  },
  {
    title: 'Focus on What Matters',
    // Svg: require('@site/static/img/undraw_docusaurus_tree.svg').default,
    description: (
      <>
        Write, run, and test your app's <strong>business logic</strong> independent
        of its UI. Expect a familiar but powerful environment with <strong>dependency
        injection</strong> and deterministic <strong>testing hooks</strong>.
      </>
    ),
  },
];

function Feature({title, Svg, description}: FeatureItem) {
  return (
    <div className="flex-1">
      <div className="">
        {/*<Svg className={styles.featureSvg} role="img" />*/}
      </div>
      <div className="">
        <h3 className="text-2xl font-serif font-bold">{title}</h3>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures(): JSX.Element {
  return (
    <section className={styles.features}>
        <div className="flex flex-row gap-4 p-4">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
    </section>
  );
}
