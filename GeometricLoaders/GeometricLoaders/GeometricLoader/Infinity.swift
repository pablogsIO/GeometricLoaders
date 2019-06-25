//
//  InfinityCircle.swift
//  GeometricLoaders
//
//  Created by Pablo Garcia on 27/10/2017.
//  Copyright © 2017 Pablo Garcia. All rights reserved.
//

import UIKit

public class Infinity: GeometricLoader {
    
    internal let radius: CGFloat = 4.0
    internal let totalCircles = 10
    
    open var circleColor = UIColor(displayP3Red: 65/255.0, green: 131/255.0, blue: 215/255.0, alpha: 1)
    
    override internal func configureLoader() {
        
        var offset = CACurrentMediaTime()
        
        for index in 1...totalCircles {
            let circle = setupCircle(radius: radius-CGFloat(index)/4)
            circle.add(opacityAnimation(beginAfter: offset), forKey: nil)
            circle.add(circleAnimation(beginAfter: offset), forKey: nil)
            
            loaderView.layer.addSublayer(circle)
            offset += 1/Double(totalCircles)
        }
    }
    private func setupCircle(radius: CGFloat) -> CAShapeLayer {
        
        let layer = CAShapeLayer()
        
        layer.bounds = CGRect(origin: CGPoint(x: loaderView.bounds.width/2, y: loaderView.bounds.height/2), size: CGSize(width: radius*2.0, height: radius*2.0))
        layer.path = UIBezierPath(roundedRect: layer.bounds, cornerRadius: radius).cgPath
        layer.fillColor = circleColor.cgColor
        layer.strokeColor = circleColor.cgColor
        layer.position = CGPoint(x: loaderView.frame.width/2, y: loaderView.frame.height/2)
        layer.opacity = 0
        
        return layer
    }
    
    private func infinityPath() -> CGPath {
        let startingPoint = CGPoint(x: loaderView.bounds.width/2, y: loaderView.bounds.height/2)
        
        let control1 = CGPoint(x: 3*loaderView.bounds.width/4, y: loaderView.bounds.height/2-loaderView.bounds.height/4)
        let control2 = CGPoint(x: 3*loaderView.bounds.width/4, y: loaderView.bounds.height/2+loaderView.bounds.height/4)
        
        let control3 = CGPoint(x: loaderView.bounds.width/4, y: loaderView.bounds.height/2-loaderView.bounds.height/4)
        let control4 = CGPoint(x: loaderView.bounds.width/4, y: loaderView.bounds.height/2+loaderView.bounds.height/4)
        
        let infinityPath = CGMutablePath()
        
        infinityPath.move(to: startingPoint)
        infinityPath.addCurve(to: startingPoint, control1: control1, control2: control2)
        infinityPath.addCurve(to: startingPoint, control1: control3, control2: control4)
        
        return infinityPath

    }
    
    private func opacityAnimation(beginAfter: TimeInterval) -> CAKeyframeAnimation {
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        
        opacityAnimation.beginTime = beginAfter
        opacityAnimation.keyTimes = [0, 0.75, 1]
        opacityAnimation.autoreverses = false
        opacityAnimation.values = [0, 0.5, 1]
        opacityAnimation.duration = 1
        opacityAnimation.fillMode = CAMediaTimingFillMode.forwards
        opacityAnimation.isRemovedOnCompletion = false
        
        return opacityAnimation
    }
    
    private func circleAnimation(beginAfter: TimeInterval) -> CAKeyframeAnimation {
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.beginTime = beginAfter
        animation.path = infinityPath()
        animation.duration = 3
        animation.repeatCount = Float.infinity
        
        return animation
    }
    
}
