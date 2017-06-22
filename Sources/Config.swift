import UIKit

public enum Kind {
  case confetti
  case image(UIImage)
  case text(String)
}

public struct Config {
  var kind: Kind = .confetti

  public init() {
    
  }
}
