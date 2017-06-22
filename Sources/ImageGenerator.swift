import UIKit

class ImageGenerator {
  func generate() -> UIImage? {
    UIGraphicsBeginImageContextWithOptions(
      CGSize(width: 10, height: 10), true, UIScreen.main.scale)

    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    return image
  }
}
