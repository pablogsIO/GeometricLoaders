//
//  GeometricLoader.swift
//  GeometricLoaders
//
//  Created by Pablo Garcia on 16/10/2017.
//  Copyright © 2017 Pablo Garcia. All rights reserved.
//

import UIKit

public class GeometricLoader: UIView {
    
    internal var loaderView = UIView()
    internal var loaderSuperview: UIView?
    internal var isAnimating = false
    
    open static func createGeometricLoader() -> Self {
        
        let loader = self.init()
        loader.setupView()
        
        return loader
    }
    
    internal func configureLoader() {
        preconditionFailure("This method has to be called from GeometricLoader subclass")
    }
 
    open func startAnimation() {
        
        self.configureLoader()
        isHidden = false
        if superview == nil {
            loaderSuperview?.addSubview(self)
        }
    }
    open func stopAnimation() {
        
        self.isHidden = false
        self.isAnimating = false
        self.removeFromSuperview()
        self.layer.removeAllAnimations()
        
    }
    
    internal func setupView() {
        
        guard let window = UIApplication.shared.delegate?.window else { return }
        guard let mainWindow = window else {return}
        
        self.frame = mainWindow.frame
        self.center = CGPoint(x: mainWindow.bounds.midX, y: mainWindow.bounds.midY)
        
        mainWindow.addSubview(self)
        
        self.loaderSuperview = mainWindow
        self.loaderView.frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width/2, height: frame.width/2)
        self.loaderView.center = CGPoint(x: frame.width/2, y: frame.height/2)
        self.loaderView.backgroundColor = UIColor.clear
        self.isHidden = true
        self.addSubview(loaderView)
        
    }
    
}
