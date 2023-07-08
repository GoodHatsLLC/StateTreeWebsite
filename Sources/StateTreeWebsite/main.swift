import Publish
import SplashPublishPlugin

try StateTreeWebsite()
  .publish(
    using: [
      .installPlugin(.splash(withClassPrefix: "")),
      .copyResources(),
      .addMarkdownFiles(),
      .sortItems(by: \.date, order: .descending),
      .generateHTML(withTheme: .localTheme),
      .generateRSSFeed(including: [.recipes, .links]),
      .generateSiteMap(),
    ]
  )
