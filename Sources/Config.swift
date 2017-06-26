import UIKit

/// The shape of particles
///
/// - confetti: A built in mix of basic shapes
/// - image: An array of images
/// - text: An array of texts
public enum Particle {
  case confetti
  case image([UIImage])
  case text(CGSize, [NSAttributedString])
}

/// Used to configure CheerView
public struct Config {
  /// Specify the particle shapes
  public var particle: Particle = .confetti

  /// The list of available colors. This will be shuffled
  public var colors: [UIColor] = [
    UIColor.red,
    UIColor.green,
    UIColor.blue,
    UIColor.yellow,
    UIColor.purple,
    UIColor.orange,
    UIColor.cyan
  ]

  /// Customize the cells
  public var customize: (([CAEmitterCell]) -> Void)?

  public init() {
    
  }
}
