import Foundation
import Plot
import Publish

// MARK: - LocalThemeWebsite

protocol LocalThemeWebsite: Website where SectionID: LocalThemeSectionID { }

// MARK: - LocalThemeSectionID

protocol LocalThemeSectionID: WebsiteSectionID {
  var type: SectionType { get }
}

// MARK: - SectionType

enum SectionType {
  case local
  case url(URL)
}

// MARK: - StateTreeWebsite

struct StateTreeWebsite: LocalThemeWebsite {

  enum SectionID: String, LocalThemeSectionID {
    case updates
    case articles
    case documentation

    var type: SectionType {
      switch self {
      case .updates:
        return .local
      case .articles:
        return .local
      case .documentation:
        return .url(URL(string: "https://docs.statetree.dev")!)
      }
    }
  }

  struct ItemMetadata: WebsiteItemMetadata {
    var date: Date
    var description: String
  }

  var url = URL(string: "https://statetree.dev")!
  var name = "StateTree"
  var description = "State management done right."
  var language: Language { .english }
  var imagePath: Path? { "Images/StateTree.webp" }
}
