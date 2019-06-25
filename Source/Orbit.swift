//
//  Orbit.swift
//  GeometricLoaders
//
//  Created by Pablo on 29/10/2017.
//  Copyright © 2017 Pablo. All rights reserved.
//

import UIKit

public class Orbit: GeometricLoader {
    
    private let radius: CGFloat = 5.0
    private var circle = CAShapeLayer()
    private var circleRadius: CGFloat = 5
    
    open var circleColor = UIColor(displayP3Red: 65/255.0, green: 131/255.0, blue: 215/255.0, alpha: 1)
    open var orbitRadius: CGFloat?
    
    override internal func configureLoader() {
        
        if orbitRadius == nil {
            orbitRadius = 3*loaderView.frame.width/4
        } else {
            assert(orbitRadius! < (self.loaderSuperview?.frame.width)!/2,"Radius \(String(describing: orbitRadius)) has to less or equals than self.loaderSuperview?.frame.width/2 \((self.loaderSuperview?.frame.width)!/2)")
        }
        loaderView.frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: orbitRadius!, height: frame.width/4)
        loaderView.center = CGPoint(x: frame.width/2, y: frame.height/2)
        
        circle = setupCircle()
        loaderView.layer.addSublayer(circle)
        circle.add(orbitAnimation(), forKey: "orbit")
    }
    
    private func setupCircle() -> CAShapeLayer {
        
        let layer = CAShapeLayer()
        
        layer.bounds = CGRect(origin: CGPoint(x: loaderView.bounds.width/2, y: loaderView.bounds.height/2), size: CGSize(width: circleRadius*2.0, height: circleRadius*2.0))
        layer.path = UIBezierPath(roundedRect: layer.bounds, cornerRadius: circleRadius).cgPath
        layer.fillColor = circleColor.cgColor
        layer.strokeColor = circleColor.cgColor
        layer.position = CGPoint(x: loaderView.layer.position.x-loaderView.frame.width, y: loaderView.frame.height/2)
        
        return layer
    }

    private func orbitAnimation() -> CAAnimationGroup {
        
        let group = CAAnimationGroup()
        let moveRight = CABasicAnimation(keyPath: "position.x")
        
        moveRight.fromValue = 0
        moveRight.toValue = loaderView.frame.width
        moveRight.duration = 2
        moveRight.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        let moveLeft = CABasicAnimation(keyPath: "position.x")
        
        moveLeft.beginTime = moveRight.duration
        moveLeft.fromValue = loaderView.frame.width
        moveLeft.toValue = 0
        moveLeft.duration = 2
        moveLeft.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        let scaleUpDown = CAKeyframeAnimation(keyPath: "transform.scale")
        
        scaleUpDown.keyTimes = [0,0.25,0.5,0.75,1]
        scaleUpDown.values = [1,1.75,1,0.5,1]
        scaleUpDown.duration = 4
        
        group.animations = [moveRight,moveLeft,scaleUpDown]
        group.duration = 4
        group.repeatCount = Float.infinity
        
        return group
        
    }
}
