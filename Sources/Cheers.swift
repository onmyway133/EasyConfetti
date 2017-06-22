import UIKit

public class CheerView: UIView {
  public var config = Config()
  var emitter: CAEmitterLayer?

  public func start() {
    stop()

    let emitter = CAEmitterLayer()
    emitter.emitterPosition = CGPoint(x: frame.width / 2.0, y: 50)
    emitter.emitterShape = kCAEmitterLayerLine
    emitter.emitterSize = CGSize(width: frame.width, height: 1)
    emitter.renderMode = kCAEmitterLayerAdditive

    let cells: [CAEmitterCell] = pickImages().map({ image in
      let cell = CAEmitterCell()
      cell.birthRate = 10
      cell.lifetime = 20.0
      cell.velocity = 250
      cell.velocityRange = 50
      cell.emissionLongitude = CGFloat.pi
      cell.spinRange = 5
      cell.scale = 0.3
      cell.scaleRange = 0.25
      cell.color = self.pickColor().cgColor
      cell.alphaSpeed = -0.1
      cell.contents = image.cgImage
      cell.xAcceleration = 20
      cell.redRange = 0.8
      cell.greenRange = 0.8

      return cell
    })

    emitter.emitterCells = cells

    layer.addSublayer(emitter)
    self.emitter = emitter
  }

  public func stop() {
    emitter?.birthRate = 0
  }

  func pickImages() -> [UIImage] {
    let generator = ImageGenerator()

    switch config.kind {
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

  func pickColor() -> UIColor {
    let index = arc4random_uniform(UInt32(config.colors.count))
    return config.colors[Int(index)]
  }
}
