import UIKit

/// The shape of particles
///
/// - confetti: A built in mix of basic shapes
/// - image: An array of images
/// - text: An array of texts
public enum Particle {
  case confetti(allowedShapes: [ConfettiShape])
  case image([UIImage])
  case text(CGSize, [NSAttributedString])

  /// The shape of a piece of confetti.
  public enum ConfettiShape {
    case rectangle, circle, triangle, curvedQuadrilateral
    public static var all: [ConfettiShape] = [
        .rectangle,
        .circle,
        .triangle,
        .curvedQuadrilateral
    ]
  }
}

/// Used to configure CheerView
public struct Config {
  /// Specify the particle shapes
    public var particle: Particle = .confetti(allowedShapes: Particle.ConfettiShape.all)

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

  /// The allowed "color range" for RGB values in each particle.
  /// For example, a value of 0.8 would allow the `CAEmitterCell().redRange`, `.greenRange`, and `.blueRange` to each vary by 0.8.
  /// If you want to tightly-specify the color of your particles, use a small value.
  /// This can be any value between 0.0 and 1.0 — see the documentation for `CAEmitterCell().redRange` for more information.
  public var colorRange: Float = 0.8

  /// Customize the cells
  public var customize: (([CAEmitterCell]) -> Void)?

  public init() {
    
  }
}
