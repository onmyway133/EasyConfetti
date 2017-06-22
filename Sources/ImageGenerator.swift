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

  func generate(string: NSAttributedString) -> UIImage? {
    return generate { context in
      let rect = CGRect(x: 0, y: 0,
                        width: size.width, height: size.height)
      context?.clear(rect)
      string.draw(in: rect)
    }
  }

  func rectangle() -> UIImage? {
    return generate { context in
      let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height/2)
      let path = UIBezierPath(rect: rect)
      context?.setFillColor(UIColor.black.cgColor)
      context?.addPath(path.cgPath)
      context?.fillPath()
    }
  }

  func circle() -> UIImage? {
    return generate { context in
      let rect = CGRect(origin: .zero, size: size)
      let path = UIBezierPath(ovalIn: rect)
      context?.setFillColor(UIColor.black.cgColor)
      context?.addPath(path.cgPath)
      context?.fillPath()
    }
  }
}
