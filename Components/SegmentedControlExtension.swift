//
//  SegmentedControlExtension.swift
//  Components
//
//  Created by Jahanvi Vyas on 22/12/2016.
//  Copyright © 2016 Jahanvi Vyas. All rights reserved.
//

import UIKit

extension UISegmentedControl {
    
    func styleBorders(color: UIColor) {
        setBackgroundImage(imageWithColor(color: UIColor.clear), for: UIControlState.normal, barMetrics: UIBarMetrics.default)
        setBackgroundImage(imageWithColor(color: color), for: UIControlState.selected, barMetrics: UIBarMetrics.default)
        applyRoundedCorners(color: color)
    }
    
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        return image!
    }
    
    func applyRoundedCorners(color: UIColor) {
        let path = UIBezierPath(roundedRect:self.bounds,
                                byRoundingCorners:[.topLeft, .bottomRight],
                                cornerRadii: CGSize(width: 20, height:  20))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
        
        let borderLayer = CAShapeLayer()
        borderLayer.frame = self.bounds
        borderLayer.path = path.cgPath
        borderLayer.lineWidth = 2.0
        borderLayer.strokeColor = color.cgColor
        borderLayer.fillColor = nil
        self.layer.addSublayer(borderLayer)
    }
}
