//
//  ViewController.swift
//  GeometricLoaders
//
//  Created by Pablo on 16/10/2017.
//  Copyright © 2017 Pablo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var segmentedControl: UISegmentedControl = UISegmentedControl()
    var geometricLoader = GeometricLoader()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let width: CGFloat = view.frame.width
        let height: CGFloat = view.frame.height
        let window = UIApplication.shared.delegate?.window!
        let items = ["Infinity", "Orbit", "Motion", "Blinking", "Circle", "Water Circle"]
        segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.layer.cornerRadius = 5.0
        segmentedControl.backgroundColor = UIColor.white
        segmentedControl.tintColor = UIColor.blue
        segmentedControl.frame = CGRect(x: 0, y: height - 40, width: width, height: 40)
        segmentedControl.addTarget(self, action: #selector(selectGeometricLoader)  , for: .valueChanged)
        geometricLoader = Infinity.createGeometricLoader()
        geometricLoader.startAnimation()
        window!.addSubview(segmentedControl)
        window?.bringSubview(toFront: segmentedControl)
    }
    
    @objc func selectGeometricLoader(_ sender: UISegmentedControl) {
        
        geometricLoader.stopAnimation()
        
        switch sender.selectedSegmentIndex {
        case 0:
            geometricLoader = Infinity.createGeometricLoader()
        case 1:
            geometricLoader = Orbit.createGeometricLoader()
        case 2:
            geometricLoader = CirclesInMotion.createGeometricLoader()
        case 3:
            geometricLoader = BlinkingCircles.createGeometricLoader()
        case 4:
            geometricLoader = CircleLoader.createGeometricLoader()
        case 5:
            geometricLoader = WaterCircles.createGeometricLoader()
        default:
            print("default")
        }
        geometricLoader.startAnimation()
        let window = UIApplication.shared.delegate?.window!
        window!.bringSubview(toFront: segmentedControl)
    }
    
}
