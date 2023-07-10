import Plot
import Publish

extension Theme where Site: LocalThemeWebsite {
  static var localTheme: Self {
    Theme(
      htmlFactory: LocalThemeHTMLFactory(),
      resourcePaths: []
    )
  }
}

extension PublishingContext where Site: LocalThemeWebsite {
  var stylesheets: [Path] {
    let folder = try! folder(at: "Resources")
    let paths = folder.files.recursive.filter { $0.extension == "css" }.map(\.path)
    let prefix = folder.path
    return paths.map { path in
      "\(path.dropFirst(prefix.count))"
    }.map(Path.init)
  }
}

// MARK: - LocalThemeHTMLFactory

private struct LocalThemeHTMLFactory<Site: LocalThemeWebsite>: HTMLFactory {

  func makeIndexHTML(
    for index: Index,
    context: PublishingContext<Site>
  ) throws
    -> HTML
  {
    HTML(
      .lang(context.site.language),
      .head(for: index, on: context.site, stylesheetPaths: context.stylesheets),
      .body {
        GridMarkers()
        SiteHeader(context: context, selectedSelectionID: nil)
          .row(._08, offset: ._02)
        Div {
          H1(index.title)
          Div {
            H2("Latest content")
            ItemList(
              items: context.allItems(
                sortedBy: \.date,
                order: .descending
              ),
              site: context.site
            )
          }
        }.row(._08, offset: ._02)
        SiteFooter().row(._08, offset: ._02)
      }
    )
  }

  func makeSectionHTML(
    for section: Section<Site>,
    context: PublishingContext<Site>
  ) throws
    -> HTML
  {
    HTML(
      .lang(context.site.language),
      .head(for: section, on: context.site, stylesheetPaths: context.stylesheets),
      .body {
        SiteHeader(context: context, selectedSelectionID: section.id)
          .row(._08, offset: ._02)
        Div {
          H1(section.title)
          ItemList(items: section.items, site: context.site)
        }
        .row(._08, offset: ._02)
        SiteFooter().row(._08, offset: ._02)
      }
    )
  }

  func makeItemHTML(
    for item: Item<Site>,
    context: PublishingContext<Site>
  ) throws
    -> HTML
  {
    HTML(
      .lang(context.site.language),
      .head(for: item, on: context.site, stylesheetPaths: context.stylesheets),
      .body(
        .class("item-page"),
        .components {
          SiteHeader(context: context, selectedSelectionID: item.sectionID)
            .row(._08, offset: ._02)
          Div {
            Article {
              Div(item.content.body).class("content")
              Span("Tagged with: ")
              ItemTagList(item: item, site: context.site)
            }
          }.row(._08, offset: ._02)
          SiteFooter().row(._08, offset: ._02)
        }
      )
    )
  }

  func makePageHTML(
    for page: Page,
    context: PublishingContext<Site>
  ) throws
    -> HTML
  {
    HTML(
      .lang(context.site.language),
      .head(for: page, on: context.site, stylesheetPaths: context.stylesheets),
      .body {
        SiteHeader(context: context, selectedSelectionID: nil)
          .row(._08, offset: ._02)
        Div(page.body).row(._08, offset: ._02)
        SiteFooter().row(._08, offset: ._02)
      }
    )
  }

  func makeTagListHTML(
    for page: TagListPage,
    context: PublishingContext<Site>
  ) throws
    -> HTML?
  {
    HTML(
      .lang(context.site.language),
      .head(for: page, on: context.site, stylesheetPaths: context.stylesheets),
      .body {
        SiteHeader(context: context, selectedSelectionID: nil)
          .row(._08, offset: ._02)
        Div {
          H1("Browse all tags")
          List(page.tags.sorted()) { tag in
            ListItem {
              Link(
                tag.string,
                url: context.site.path(for: tag).absoluteString
              )
            }
            .class("tag")
          }
          .class("all-tags")
        }.row(._08, offset: ._02)
        SiteFooter().row(._08, offset: ._02)
      }
    )
  }

  func makeTagDetailsHTML(
    for page: TagDetailsPage,
    context: PublishingContext<Site>
  ) throws
    -> HTML?
  {
    HTML(
      .lang(context.site.language),
      .head(for: page, on: context.site, stylesheetPaths: context.stylesheets),
      .body {
        SiteHeader(context: context, selectedSelectionID: nil)
          .row(._08, offset: ._02)
        Row(._08) {
          H1 {
            Text("Tagged with ")
            Span(page.tag.string).class("tag")
          }

          Link(
            "Browse all tags",
            url: context.site.tagListPath.absoluteString
          )
          .class("browse-all")

          ItemList(
            items: context.items(
              taggedWith: page.tag,
              sortedBy: \.date,
              order: .descending
            ),
            site: context.site
          )
        }.row(._08, offset: ._02)
        SiteFooter().row(._08, offset: ._02)
      }
    )
  }
}

// MARK: - GridMarkers

private struct GridMarkers: Component {
  var body: Component {
    Row {
      ComponentGroup {
        for i in 0 ..< 12 {
          let n = String(2 + i, radix: 16)
          Col(._01) {
            Text("&nbsp;")
          }.style("background-color: #\(n)\(n)\(n)\(n)\(n)\(n);")
        }
      }
    }
  }
}

// MARK: - SiteHeader

private struct SiteHeader<Site: LocalThemeWebsite>: Component {

  // MARK: Internal

  var context: PublishingContext<Site>
  var selectedSelectionID: Site.SectionID?

  var body: Component {
    Header {
      Col(._02) {
        Link(url: "/") {
          Image("/images/StateTree.webp")
        }.id("logo")
      }
      Col(._02) {
        Link(url: "/") {
          H1("StateTree")
        }
        .id("logotype")
        .row()
        Paragraph(context.site.description)
          .row()
      }
      Col(._04) {
        if Site.SectionID.allCases.count > 1 {
          navigation
        }
      }
    }.row(._08)
  }

  // MARK: Private

  private var navigation: Component {
    Navigation {
      List(Site.SectionID.allCases) { sectionID in
        let section = context.sections[sectionID]
        switch sectionID.type {
        case .local:
          return Link(
            section.title,
            url: section.path.absoluteString
          )
          .class(sectionID == selectedSelectionID ? "selected" : "")
        case .url(let url):
          return Link(
            section.title,
            url: url.absoluteString
          )
          .class(sectionID == selectedSelectionID ? "selected" : "")
        }
      }
    }
  }
}

// MARK: - ItemList

private struct ItemList<Site: Website>: Component {
  var items: [Item<Site>]
  var site: Site

  var body: Component {
    List(items) { item in
      Article {
        H1(Link(item.title, url: item.path.absoluteString))
        ItemTagList(item: item, site: site)
        Paragraph(item.description)
      }
    }
    .class("item-list")
  }
}

// MARK: - ItemTagList

private struct ItemTagList<Site: Website>: Component {
  var item: Item<Site>
  var site: Site

  var body: Component {
    List(item.tags) { tag in
      Link(tag.string, url: site.path(for: tag).absoluteString)
    }
    .class("tag-list")
  }
}

// MARK: - SiteFooter

private struct SiteFooter: Component {
  var body: Component {
    Footer {
      Paragraph {
        Link("RSS feed", url: "/feed.rss")
      }
    }
  }
}
