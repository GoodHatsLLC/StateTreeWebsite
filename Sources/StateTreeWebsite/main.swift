import Foundation
import Publish
import SplashPublishPlugin

private func root(path: String = #file) -> String {
  var path = path.split(separator: "/")
  path.removeLast(3)
  return "/\(path.joined(separator: "/"))"
}

try StateTreeWebsite()
  .publish(
    using: [
      .installPlugin(.splash(withClassPrefix: "")),
      .copyResources(),
      .addMarkdownFiles(),
      .sortItems(by: \.date, order: .descending),
      .generateHTML(withTheme: .localTheme),
      .generateRSSFeed(including: [.articles, .updates]),
      .generateSiteMap(),
    ]
  )
