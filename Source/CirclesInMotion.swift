//
//  CirclesInSquare.swift
//  GeometricLoaders
//
//  Created by Pablo on 22/10/2017.
//  Copyright © 2017 Pablo. All rights reserved.
//

import UIKit

public class CirclesInMotion: GeometricLoader {
    
    private var circles = [CAShapeLayer]()
    private let totalCircles = 4
    private var circleRadius :CGFloat = 5
    
    open var circleColor = UIColor(displayP3Red: 65/255.0, green: 131/255.0, blue: 215/255.0, alpha: 1)
    
    override internal func configureLoader() {
        
        loaderView.frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width/20, height: frame.width/20)
        loaderView.center = CGPoint(x: frame.width/2, y: frame.height/2)
        
        for _ in 1...totalCircles {
            circles.append(setupCircle())
        }
        circlesAnimation()
    }
    
    private func setupCircle() -> CAShapeLayer {
        
        let layer = CAShapeLayer()
        
        layer.bounds = CGRect(origin: CGPoint(x: loaderView.bounds.width/2, y: loaderView.bounds.height/2), size: CGSize(width: circleRadius*2.0, height: circleRadius*2.0))
        layer.path = UIBezierPath(roundedRect: layer.bounds, cornerRadius: circleRadius).cgPath
        layer.fillColor = circleColor.cgColor
        layer.position = CGPoint(x: loaderView.bounds.width/2, y: loaderView.bounds.height/2)
        loaderView.layer.addSublayer(layer)
        
        return layer
    }
    
    private func circlesAnimation() {
        
        var offset :TimeInterval = CACurrentMediaTime()
        
        loaderView.layer.add(rotationAnimation(beginAfter: offset), forKey: nil)
        var index = 0
        circles.forEach {
            index += 1
            $0.add(scaleAndMoveToCornerAnimation(position: index), forKey: "scaleandmovetocorner")
            offset += 0.25
        }
    }
    
    private func rotationAnimation(beginAfter: TimeInterval) -> CABasicAnimation {
        
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        
        animation.beginTime = beginAfter
        animation.fromValue = 0
        animation.toValue = 2*CGFloat.pi
        animation.duration = 1.5
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = Float.infinity
        
        return animation
    }
    
    private func scaleAndMoveToCornerAnimation(position: Int) -> CAAnimationGroup {
        
        let animationGroup = CAAnimationGroup()
        
        animationGroup.animations = [scaleAnimation(), moveToCornerAnimation(position: position)]
        animationGroup.duration = 2
        animationGroup.fillMode = CAMediaTimingFillMode.forwards
        animationGroup.isRemovedOnCompletion = false
        
        return animationGroup
    }
    
    private func scaleAnimation() -> CABasicAnimation {
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        
        scaleAnimation.fromValue = 0
        scaleAnimation.toValue = 1
        scaleAnimation.duration = 2
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        
        return scaleAnimation
    }
    
    private func moveToCornerAnimation(position: Int) -> CABasicAnimation {
        
        let moveAnimation = CABasicAnimation(keyPath: "position")
        
        moveAnimation.fromValue = CGPoint(x: loaderView.bounds.width/2, y: loaderView.bounds.height/2)
        switch position {
        case 1:
            moveAnimation.toValue = CGPoint(x: 0, y: 0)
        case 2:
            moveAnimation.toValue = CGPoint(x: loaderView.bounds.width, y: 0)
        case 3:
            moveAnimation.toValue = CGPoint(x: loaderView.bounds.width, y: loaderView.bounds.height)
        case 4:
            moveAnimation.toValue = CGPoint(x: 0, y: loaderView.bounds.height)
        default:
            break
        }
        moveAnimation.duration = 2
        moveAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        moveAnimation.fillMode = CAMediaTimingFillMode.forwards
        moveAnimation.isRemovedOnCompletion = false
        
        return moveAnimation
        
    }
}
