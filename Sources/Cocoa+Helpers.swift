//
//  Cocoa+Helpers.swift
//  Cheers-macOS
//
//  Created by Boy van Amstel on 07/11/2018.
//  Copyright © 2018 Hyper Interaktiv AS. All rights reserved.
//

import Cocoa

public typealias UIImage = NSImage
public extension NSImage {
    var cgImage: CGImage? {
        var proposedRect = CGRect(origin: .zero, size: size)
        
        return cgImage(forProposedRect: &proposedRect,
                       context: nil,
                       hints: nil)
    }
}

public typealias UIColor = NSColor

public typealias UIView = NSView

public typealias UIBezierPath = NSBezierPath
public extension NSBezierPath {
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
