//
//  CirclesLine.swift
//  GeometricLoaders
//
//  Created by Pablo on 25/10/2017.
//  Copyright © 2017 Pablo. All rights reserved.
//

import UIKit

public class BlinkingCircles: GeometricLoader,CAAnimationDelegate {
    
    private var circles = [CAShapeLayer]()
    private var circleRadius :CGFloat = 5
    private let circlesSpacing = 15
    private var firstCirclePosition = CGPoint.zero
    
    open var totalCircles = 5
    open var circleColor = UIColor(displayP3Red: 65/255.0, green: 131/255.0, blue: 215/255.0, alpha: 1)
    
    override internal func configureLoader() {
        
        loaderView.frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: frame.width/10)
        loaderView.center = CGPoint(x: frame.width/2, y: frame.height/2)
        
        calculateFirstCirclePosition()
        
        for _ in 0..<totalCircles {
            circles.append(setupCircle())
        }
        circlesInLineAnimation()
    }
    
    private func calculateFirstCirclePosition() {
        let center = CGPoint(x: loaderView.frame.size.width/2.0, y: loaderView.frame.size.height/2.0)
        let even = (totalCircles % 2 == 0)
        let middle :Int = totalCircles/2
        let circleOffset = even ? CGFloat(circlesSpacing)/2.0 :  CGFloat(-circleRadius)/2.0
        let xPos: CGFloat = center.x - CGFloat(middle*circlesSpacing) + circleOffset
        
        firstCirclePosition.x = xPos
        firstCirclePosition.y = center.y
    }
    
    private func setupCircle() -> CAShapeLayer {
        
        let layer = CAShapeLayer()
        
        layer.bounds = CGRect(origin: CGPoint(x: loaderView.bounds.width/2, y: loaderView.bounds.height/2), size: CGSize(width: circleRadius*2.0, height: circleRadius*2.0))
        layer.path = UIBezierPath(roundedRect: layer.bounds, cornerRadius: circleRadius).cgPath
        layer.fillColor = circleColor.cgColor
        layer.strokeColor = circleColor.cgColor
        
        layer.position = CGPoint(x: firstCirclePosition.x, y: firstCirclePosition.y)
        
        layer.opacity = 0
        loaderView.layer.addSublayer(layer)
        
        return layer
    }
    
    private func circlesInLineAnimation() {
        
        let startingTimeInterval = CACurrentMediaTime()
        var offset = 0.0
        let offsetFactor = 0.5
        let scaleAnimationOffset = Double(totalCircles)*offsetFactor
        
        circles[0].add(opacityAnimation(beginAfter: startingTimeInterval,duration: 0.5), forKey: "opacity")
        circles[0].add(scaleCircleAnimation(beginAfter: (startingTimeInterval+scaleAnimationOffset)), forKey: nil)
        offset += offsetFactor
        for index in 1..<circles.count {
            circles[index].add(opacityAnimation(beginAfter: startingTimeInterval+offset), forKey: "opacity")
            circles[index].add(moveCircle(index: index, beginAfter: startingTimeInterval+offset), forKey: nil)
            circles[index].add(scaleCircleAnimation(beginAfter: (startingTimeInterval+scaleAnimationOffset+offset/2)), forKey: nil)
            offset += offsetFactor
        }
    }
    
    private func moveCircle(index: Int,beginAfter: TimeInterval) -> CABasicAnimation {
        
        let moveAnimation = CABasicAnimation(keyPath: "position")
        
        moveAnimation.beginTime = beginAfter
        moveAnimation.fromValue = CGPoint(x: firstCirclePosition.x + CGFloat((index-1)*circlesSpacing),y: firstCirclePosition.y)
        moveAnimation.toValue = CGPoint(x: firstCirclePosition.x + CGFloat((index)*circlesSpacing),y: firstCirclePosition.y)
        moveAnimation.duration = 0.5
        moveAnimation.fillMode = CAMediaTimingFillMode.forwards
        moveAnimation.isRemovedOnCompletion = false

        return moveAnimation
    }
    private func opacityAnimation(beginAfter: TimeInterval, duration: TimeInterval = 0.1) -> CAKeyframeAnimation {
        
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        
        opacityAnimation.beginTime = beginAfter
        opacityAnimation.keyTimes = [0, 0.75, 1]
        opacityAnimation.autoreverses = false
        opacityAnimation.values = [0, 0.5, 1]
        opacityAnimation.duration = duration
        opacityAnimation.fillMode = CAMediaTimingFillMode.forwards
        opacityAnimation.isRemovedOnCompletion = false
        
        return opacityAnimation
    }
    
    private func scaleCircleAnimation(beginAfter: TimeInterval = 0) -> CAAnimationGroup {
        
        let scaleDown = CABasicAnimation(keyPath: "transform.scale")
        
        scaleDown.fromValue = 1
        scaleDown.toValue = 0.3
        scaleDown.duration = 0.5
        scaleDown.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        scaleDown.fillMode = CAMediaTimingFillMode.forwards
        scaleDown.isRemovedOnCompletion = false
        
        let scaleUp = CABasicAnimation(keyPath: "transform.scale")
        
        scaleUp.beginTime = scaleDown.duration/2.0
        scaleUp.fromValue = 0.3
        scaleUp.toValue = 1
        scaleUp.duration = 0.3
        scaleUp.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        scaleUp.fillMode = CAMediaTimingFillMode.forwards
        scaleUp.isRemovedOnCompletion = false
        
        let group = CAAnimationGroup()
        group.beginTime = beginAfter
        group.animations = [scaleDown,scaleUp]
        group.repeatCount = Float.infinity
        
        let sum = Double(totalCircles)*(scaleDown.duration)/2.0
        group.duration = CFTimeInterval(sum)
        
        return group
    }

}
