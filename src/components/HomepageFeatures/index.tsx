import React from "react";
import clsx from "clsx";

type FeatureItem = {
  title: string;
  description: JSX.Element;
};

const FeatureList: FeatureItem[] = [
  {
    title: "Intuitive",
    description: (
      <>
        StateTree makes the <a href="#">standard</a> declarative coding style <strong>more powerful</strong>.
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
        <p>The toughest testing problems are solved upfront. <strong>Side effects</strong>, <strong>dependencies</strong>, and <strong>lifecycles</strong> are easy to manage and deterministic to mock.</p>
        <p>The toughest testing problems are solved upfront. <strong>Side effects</strong>, <strong>dependencies</strong>, and <strong>lifecycles</strong> are easy to manage and deterministic to mock.</p>
      </>
    ),
  },
];

function Feature({ title, description }: FeatureItem) {
  return (
    <div className="lg:basis-1/3 sm:basis-full p-2">
        <h3 className="text-2xl font-serif font-bold mb-3">{title}</h3>
        <div className="h-full">{description}</div>
    </div>
  );
}
export default function HomepageFeatures(): JSX.Element {
  return (
    <section className="m-auto flex flex-1 flex-row flex-wrap items-start content-center md:p-2 lg:p-8 max-w-7xl">
        {FeatureList.map((props, idx) => (
          <Feature key={idx} {...props} />
        ))}
    </section>
  );
}
