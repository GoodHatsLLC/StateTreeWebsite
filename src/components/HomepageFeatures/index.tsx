import React from "react";
import clsx from "clsx";
import styles from "./styles.module.css";

type FeatureItem = {
  title: string;
  description: JSX.Element;
};

const FeatureList: FeatureItem[] = [
  {
    title: "Intuitive",
    description: (
      <>
        StateTree makes the standard declarative coding style <strong>more powerful</strong>.
        It doesn't discard make you discard it. <strong>There's no Redux here</strong>.
      </>
    ),
  },
  {
    title: "Powerful",
    description: (
      <>
        StateTree is both reactive and fully <strong>data driven</strong>.
        It supports <strong>deep linking</strong> across any app states and enables state saving and replay <strong>out of the box</strong>.
      </>
    ),
  },
  {
    title: "Testable",
    description: (
      <>
        The toughest testing problems are solved upfront. <strong>Side effects</strong>, <strong>dependencies</strong>, and <strong>lifecycles</strong> are easy to manage and deterministic to mock.
      </>
    ),
  },
];

function Feature({ title, description }: FeatureItem) {
  return (
    <div className="flex-1">
        <h3 className="text-2xl font-serif font-bold mb-3">{title}</h3>
        <p>{description}</p>
    </div>
  );
}

export default function HomepageFeatures(): JSX.Element {
  return (
    <section className={styles.features}>
      <div className="flex flex-row gap-4 p-5">
        {FeatureList.map((props, idx) => (
          <Feature key={idx} {...props} />
        ))}
      </div>
    </section>
  );
}
