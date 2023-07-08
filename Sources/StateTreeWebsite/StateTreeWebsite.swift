import Foundation
import Plot
import Publish

struct StateTreeWebsite: Website {
  enum SectionID: String, WebsiteSectionID {
    case recipes
    case links
    case about
  }

  struct ItemMetadata: WebsiteItemMetadata {
    var someInfo: String
  }

  var url = URL(string: "https://statetree.dev")!
  var name = "StateTree"
  var description = "State management done right."
  var language: Language { .english }
  var imagePath: Path? { "Images/StateTree.webp" }
}
