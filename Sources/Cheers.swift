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

    let cell = CAEmitterCell()
    cell.birthRate = 20
    cell.lifetime = 40.0
    cell.velocity = 200
    cell.velocityRange = 250
    cell.emissionLongitude = CGFloat.pi
    cell.spinRange = 50
    cell.scale = 0.2
    cell.scaleRange = 0.25
    cell.color = UIColor.green.cgColor
    cell.alphaSpeed = -0.025
    cell.redSpeed = 0.8
    cell.blueSpeed = 0.5
    cell.contents = ImageGenerator().generate()?.cgImage

    emitter.emitterCells = [cell]

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
}
