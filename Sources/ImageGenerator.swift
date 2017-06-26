import UIKit

class ImageGenerator {
  private let size = CGSize(width: 20, height: 20)

  private func generate(block: (CGContext?) -> Void) -> UIImage? {
    UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
    let context = UIGraphicsGetCurrentContext()
    block(context)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    return image
  }

  func generate(size: CGSize, string: NSAttributedString) -> UIImage? {
    return generate { context in
      let rect = CGRect(origin: .zero, size: size)
      context?.clear(rect)
      string.draw(in: rect)
    }
  }

  func rectangle() -> UIImage? {
    return generate { context in
      let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height/2)
      let path = UIBezierPath(rect: rect)
      context?.setFillColor(UIColor.white.cgColor)
      context?.addPath(path.cgPath)
      context?.fillPath()
    }
  }

  func circle() -> UIImage? {
    return generate { context in
      let rect = CGRect(origin: .zero, size: size)
      let path = UIBezierPath(ovalIn: rect)
      context?.setFillColor(UIColor.white.cgColor)
      context?.addPath(path.cgPath)
      context?.fillPath()
    }
  }

  func triangle() -> UIImage? {
    return generate { context in
      let path = UIBezierPath()
      path.move(to: CGPoint(x: size.width/2, y: 0))
      path.addLine(to: CGPoint(x: size.width, y: size.height))
      path.addLine(to: CGPoint(x: 0, y: size.height))
      path.close()
      context?.setFillColor(UIColor.white.cgColor)
      context?.addPath(path.cgPath)
      context?.fillPath()
    }
  }

  func curvedQuadrilateral() -> UIImage? {
    return generate { context in
      let path = UIBezierPath()
      let rightPoint = CGPoint(x: size.width - 5, y: 5)
      let leftPoint = CGPoint(x: size.width * 0.5, y: size.height - 8)

      // top left
      path.move(to: CGPoint.zero)
      path.addLine(to: CGPoint(x: size.width * 0.3, y: 0))

      // bottom right
      path.addQuadCurve(to: CGPoint(x: size.width, y: size.height),
                        controlPoint: rightPoint)
      path.addLine(to: CGPoint(x: size.width * 0.7, y: size.height))

      // close to top left
      path.addQuadCurve(to: CGPoint.zero,
                        controlPoint: leftPoint)
      path.close()
      context?.setFillColor(UIColor.white.cgColor)
      context?.addPath(path.cgPath)
      context?.fillPath()
    }
  }
}
