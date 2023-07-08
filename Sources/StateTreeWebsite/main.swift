import Publish
import SplashPublishPlugin

try StateTreeWebsite()
  .publish(
    using: [
      .installPlugin(.splash(withClassPrefix: "")),
      .addMarkdownFiles(),
      .generateHTML(withTheme: .foundation),
      .generateRSSFeed(including: [.recipes, .links]),
      .generateSiteMap(),
    ]
  )
