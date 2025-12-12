//
//  macOS+extensions.swift
//  EasyConfetti
//
//  Created by khoa on 8/12/2021.
//


#if os(OSX)

import AppKit

public typealias UXBezierPath = NSBezierPath
public typealias UXColor = NSColor
public typealias UXImage = NSImage
public typealias UXView = NSView

extension NSImage {
    var cgImage: CGImage? {
        var proposedRect = CGRect(origin: .zero, size: size)

        return cgImage(
            forProposedRect: &proposedRect,
            context: nil,
            hints: nil
        )
    }
}

extension NSBezierPath {
    var cgPath: CGPath {
        let path = CGMutablePath()
        var points = [CGPoint](repeating: .zero, count: 3)
        for i in 0 ..< self.elementCount {
            let type = self.element(at: i, associatedPoints: &points)
            switch type {
            case .moveTo: path.move(to: points[0])
            case .lineTo: path.addLine(to: points[0])
            case .curveTo: path.addCurve(to: points[2], control1: points[0], control2: points[1])
            case .closePath: path.closeSubpath()
            default:
                break
            }
        }
        return path
    }

    func addLine(to point: CGPoint, transform: CGAffineTransform = CGAffineTransform()) {
        line(to: point)
    }

    func addQuadCurve(to point: CGPoint, controlPoint: CGPoint) {
        curve(to: point, controlPoint1: controlPoint, controlPoint2: controlPoint)
    }
}

#else

import UIKit

public typealias UXBezierPath = UIBezierPath
public typealias UXColor = UIColor
public typealias UXImage = UIImage
public typealias UXView = UIView

#endif
