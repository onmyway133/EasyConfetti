//
//  ImageGenerator.swift
//  EasyConfetti
//
//  Created by khoa on 8/12/2021.
//

#if os(OSX)
import AppKit
#else
import UIKit
#endif


class ImageGenerator {
    private let size = CGSize(width: 20, height: 20)

    private func generate(block: @escaping (CGContext?) -> Void) -> UXImage? {
        var image: UXImage?
#if os(OSX)
        image = NSImage(size: size, flipped: false) { (rect) -> Bool in
            let context = NSGraphicsContext.current!.cgContext
            NSGraphicsContext.saveGraphicsState()
            block(context)
            NSGraphicsContext.restoreGraphicsState()

            return true
        }
#else
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        block(context)
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
#endif

        return image
    }

    func generate(size: CGSize, string: NSAttributedString) -> UXImage? {
        return generate { context in
            let rect = CGRect(origin: .zero, size: size)
            context?.clear(rect)
            string.draw(in: rect)
        }
    }

    func confetti(shape: Particle.ConfettiShape) -> UXImage? {
        switch shape {
        case .rectangle: return rectangle()
        case .circle: return circle()
        case .triangle: return triangle()
        case .curvedQuadrilateral: return curvedQuadrilateral()
        }
    }

    private func rectangle() -> UXImage? {
        return generate { context in
            let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height/2)
            let path = UXBezierPath(rect: rect)
            context?.setFillColor(UXColor.white.cgColor)
            context?.addPath(path.cgPath)
            context?.fillPath()
        }
    }

    private func circle() -> UXImage? {
        return generate { context in
            let rect = CGRect(origin: .zero, size: self.size)
            let path = UXBezierPath(ovalIn: rect)
            context?.setFillColor(UXColor.white.cgColor)
            context?.addPath(path.cgPath)
            context?.fillPath()
        }
    }

    private func triangle() -> UXImage? {
        return generate { context in
            let path = UXBezierPath()
            path.move(to: CGPoint(x: self.size.width/2, y: 0))
            path.addLine(to: CGPoint(x: self.size.width, y: self.size.height))
            path.addLine(to: CGPoint(x: 0, y: self.size.height))
            path.close()
            context?.setFillColor(UXColor.white.cgColor)
            context?.addPath(path.cgPath)
            context?.fillPath()
        }
    }

    private func curvedQuadrilateral() -> UXImage? {
        return generate { context in
            let path = UXBezierPath()
            let rightPoint = CGPoint(x: self.size.width - 5, y: 5)
            let leftPoint = CGPoint(x: self.size.width * 0.5, y: self.size.height - 8)

            // top left
            path.move(to: CGPoint.zero)
            path.addLine(to: CGPoint(x: self.size.width * 0.3, y: 0))

            // bottom right
            path.addQuadCurve(to: CGPoint(x: self.size.width, y: self.size.height),
                              controlPoint: rightPoint)
            path.addLine(to: CGPoint(x: self.size.width * 0.7, y: self.size.height))

            // close to top left
            path.addQuadCurve(to: CGPoint.zero,
                              controlPoint: leftPoint)
            path.close()
            context?.setFillColor(UXColor.white.cgColor)
            context?.addPath(path.cgPath)
            context?.fillPath()
        }
    }
}
