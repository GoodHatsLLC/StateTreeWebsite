import Plot

// MARK: - GridValue

private struct GridValue {
  let role: GridRole
  let offset: GridSpan?
  let span: GridSpan?
  init(_ role: GridRole, _ span: GridSpan?, offset: GridSpan? = nil) {
    self.role = role
    self.span = span
    self.offset = offset
  }

  var value: String {
    "\(role.value)\(offset.map { ":\($0.value)" } ?? ""):\(span?.value ?? "")"
  }
}

// MARK: - GridRoleType

public protocol GridRoleType {
  static var role: GridRole { get }
}

// MARK: - GridRow

public enum GridRow: GridRoleType {
  public static var role: GridRole { .row }
}

// MARK: - GridCol

public enum GridCol: GridRoleType {
  public static var role: GridRole { .col }
}

// MARK: - GridRole

public enum GridRole {
  case row
  case col
  var value: String {
    switch self {
    case .row:
      "row"
    case .col:
      "col"
    }
  }
}

// MARK: - GridSpan

public enum GridSpan {
  case _01
  case _02
  case _03
  case _04
  case _05
  case _06
  case _07
  case _08
  case _09
  case _10
  case _11
  case _12

  var value: String {
    switch self {
    case ._01: "1"
    case ._02: "2"
    case ._03: "3"
    case ._04: "4"
    case ._05: "5"
    case ._06: "6"
    case ._07: "7"
    case ._08: "8"
    case ._09: "9"
    case ._10: "10"
    case ._11: "11"
    case ._12: "12"
    }
  }
}

// MARK: - Row

public struct Row: Component {
  public init(
    _ span: GridSpan? = nil,
    offset: GridSpan? = nil,
    @ComponentBuilder content: @escaping ContentProvider
  ) {
    self.value = .init(.row, span, offset: offset)
    self.content = content
  }

  @ComponentBuilder var content: ContentProvider
  private let value: GridValue
  public var body: Component {
    Div(content: content).grid(value: value)
  }
}

// MARK: - Col

public struct Col: Component {
  public init(
    _ span: GridSpan,
    offset: GridSpan? = nil,
    @ComponentBuilder content: @escaping ContentProvider
  ) {
    self.value = .init(.col, span, offset: offset)
    self.content = content
  }

  @ComponentBuilder var content: ContentProvider
  private let value: GridValue
  public var body: Component {
    Div(content: content).grid(value: value)
  }
}

extension Component {

  // MARK: Public

  public func row(_ span: GridSpan? = nil, offset: GridSpan? = nil) -> Component {
    attribute(named: "grid", value: GridValue(.row, span, offset: offset).value)
  }

  public func col(_ span: GridSpan, offset: GridSpan? = nil) -> Component {
    attribute(named: "grid", value: GridValue(.col, span, offset: offset).value)
  }

  // MARK: Fileprivate

  fileprivate func grid(value: GridValue) -> Component {
    attribute(named: "grid", value: value.value)
  }

}
