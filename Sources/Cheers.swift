import UIKit

/// The view to show particles
public class CheerView: UIView {
  public var config = Config()
  var emitter: CAEmitterLayer?

  public override func didMoveToSuperview() {
    super.didMoveToSuperview()

    isUserInteractionEnabled = false
  }

  /// Start animation
  public func start() {
    stop()

    let emitter = CAEmitterLayer()
    emitter.emitterPosition = CGPoint(x: frame.width / 2.0, y: 0)
    emitter.emitterShape = kCAEmitterLayerLine
    emitter.emitterSize = CGSize(width: frame.width, height: 1)
    emitter.renderMode = kCAEmitterLayerAdditive

    let colors = config.colors.shuffled()

    let cells: [CAEmitterCell] = pickImages().enumerated().map({ index, image in
      let cell = CAEmitterCell()
      cell.birthRate = 10
      cell.lifetime = 20.0
      cell.velocity = 250
      cell.velocityRange = 50
      cell.emissionLongitude = CGFloat.pi
      cell.emissionRange = CGFloat.pi * 0.2
      cell.spinRange = 5
      cell.scale = 0.3
      cell.scaleRange = 0.2
      cell.color = colors[(index % colors.count)].cgColor
      cell.alphaSpeed = -0.1
      cell.contents = image.cgImage
      cell.xAcceleration = 20
      cell.redRange = 0.8
      cell.greenRange = 0.8
      cell.blueRange = 0.8

      return cell
    })

    emitter.emitterCells = cells

    layer.addSublayer(emitter)
    self.emitter = emitter
  }

  /// Stop animation
  public func stop() {
    emitter?.birthRate = 0
  }

  func pickImages() -> [UIImage] {
    let generator = ImageGenerator()

    switch config.particle {
    case .confetti:
      return [generator.rectangle(), generator.circle(),
              generator.triangle(), generator.curvedQuadrilateral()]
        .flatMap({ $0 })
    case .image(let images):
      return images
    case .text(let strings):
      return strings.flatMap({ generator.generate(string: $0) })
    }
  }
}
