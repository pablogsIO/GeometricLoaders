//
//  WaterCircles.swift
//  GeometricLoaders
//
//  Created by Pablo on 06/06/2018.
//  Copyright © 2018 Pablo. All rights reserved.
//
import UIKit

public class WaterWaves: GeometricLoader {
    
    internal var shapeLayer = CAShapeLayer()
    internal var duration: CGFloat = 5.0
    private var circleRadius: CGFloat = 20
    open var numberCircles = 3
    
    open var circleColor = UIColor(displayP3Red: 65/255.0, green: 131/255.0, blue: 215/255.0, alpha: 1)
    
    override internal func configureLoader() {

        let startingTimeInterval = CACurrentMediaTime()
        var offset = 2.0
        let offsetFactor = 0.5
        
        for _ in 1...numberCircles {
            
            var circle = CAShapeLayer()
            
            circle = setupCircle()
            loaderView.layer.addSublayer(circle)
            circle.add(groupAnimation(begin: startingTimeInterval + offset), forKey: "scale")
            offset += offsetFactor
            
        }
    }
    
    private func setupCircle() -> CAShapeLayer {
        
        let layer = CAShapeLayer()
        
        layer.bounds = CGRect(origin: CGPoint(x: loaderView.bounds.width/2, y: loaderView.bounds.height/2), size: CGSize(width: circleRadius*2.0, height: circleRadius*2.0))
        layer.path = UIBezierPath(roundedRect: layer.bounds, cornerRadius: circleRadius).cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 2
        layer.strokeColor = circleColor.cgColor
        layer.opacity = 0
        layer.position = CGPoint(x: loaderView.layer.position.x-loaderView.frame.width/2, y: loaderView.frame.height/2)
        
        return layer
    }
    
    private func groupAnimation(begin: TimeInterval) -> CAAnimationGroup {
        
        let animationGroup = CAAnimationGroup()
        animationGroup.beginTime = begin
        animationGroup.animations = [fadeInAnimation(),scaleAnimation(),fadeOutAnimation()]
        animationGroup.duration = 2
        animationGroup.fillMode = CAMediaTimingFillMode.forwards
        animationGroup.isRemovedOnCompletion = false
        animationGroup.repeatCount = .infinity
        
        return animationGroup
    }
    
    private func fadeInAnimation() -> CABasicAnimation {
        
        let fadeIn = CABasicAnimation(keyPath: "opacity")
        
        fadeIn.fromValue = 0.0
        fadeIn.toValue = 1.0
        fadeIn.duration = 0.0
        
        return fadeIn
    }

    private func fadeOutAnimation() -> CABasicAnimation {
        
        let fadeOut = CABasicAnimation(keyPath: "opacity")
        
        fadeOut.fromValue = 1.0
        fadeOut.toValue = 0.0
        fadeOut.duration = 2.0
     
        return fadeOut
    }
    
    private func scaleAnimation() -> CABasicAnimation {

        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        
        scaleAnimation.fromValue = 0.1
        scaleAnimation.toValue = 1.5
        scaleAnimation.duration = 2
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        
        return scaleAnimation
    }
}
