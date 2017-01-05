//
//  ButtonExtention.swift
//  Components
//
//  Created by Jahanvi Vyas on 22/12/2016.
//  Copyright © 2016 Jahanvi Vyas. All rights reserved.
//

import UIKit

extension UIButton
{
    func addBorder(borderColor: UIColor) {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = 1.0
    }
    func addImage(image: UIImage) {
        self.setImage(image, for: UIControlState.normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -15, bottom: 0, right: 0)
    }
    
    func setImageAndBorder(image: UIImage, borderColor: UIColor) {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = 1.0
        self.setImage(image, for: UIControlState.normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -15, bottom: 0, right: 0)
    }
    
    func addUnderLine(lineColor: UIColor, textColor: UIColor, isMultiline: Bool) {
        //Set lineBreakMode
        if(isMultiline)
        {
            self.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
            self.titleLabel?.textAlignment = NSTextAlignment.center
        }
        else
        {
            self.sizeToFit()
        }
        //Set textColor
        self.setTitleColor(textColor, for: UIControlState.normal)
        
        //Set underline
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: 0, y: self.frame.size.height))
        linePath.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        
        let lineLayer = CAShapeLayer()
        lineLayer.path = linePath.cgPath
        lineLayer.fillColor = UIColor.clear.cgColor
        lineLayer.strokeColor = lineColor.cgColor
        lineLayer.lineWidth = 2.0
        layer.addSublayer(lineLayer)
    }
}
