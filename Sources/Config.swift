import UIKit

public enum Kind {
  case confetti
  case image([UIImage])
  case text([NSAttributedString])
}

public struct Config {
  public var kind: Kind = .confetti
  public var colors: [UIColor] = [
    UIColor.red,
    UIColor.green,
    UIColor.blue,
    UIColor.yellow,
    UIColor.purple,
  ]

  public init() {
    
  }
}
