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
      cell.birthRate = 1
      cell.lifetime = 20.0
      cell.velocity = 200
      cell.velocityRange = 250
      cell.emissionLongitude = CGFloat.pi
      cell.spinRange = 5
      cell.scale = 0.5
      cell.scaleRange = 0.25
      cell.color = self.pickColor().cgColor
      cell.alphaSpeed = -0.025
      cell.contents = image.cgImage

      return cell
    })

    emitter.emitterCells = cells

    layer.addSublayer(emitter)
    self.emitter = emitter
  }

  public func stop() {
    guard let emitter = emitter else {
      return
    }

    emitter.birthRate = 0
    emitter.removeFromSuperlayer()
  }

  func pickImages() -> [UIImage] {
    let generator = ImageGenerator()

    switch config.kind {
    case .confetti:
      return [generator.rectangle(), generator.circle()].flatMap({ $0 })
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
