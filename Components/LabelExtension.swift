//
//  LabelExtention.swift
//  Components
//
//  Created by Jahanvi Vyas on 22/12/2016.
//  Copyright © 2016 Jahanvi Vyas. All rights reserved.
//

import UIKit

extension UILabel
{
    func addImage(imageName: String) {
        self.textAlignment = NSTextAlignment.left
        
        let attachment:NSTextAttachment = NSTextAttachment()
        attachment.image = UIImage(named: imageName)
        let attributedString:NSMutableAttributedString = NSMutableAttributedString(attributedString: NSAttributedString(attachment: attachment))
        attributedString.append(NSAttributedString(string: " "))
        attributedString.append(NSAttributedString(string: self.text!))
        
        self.attributedText = attributedString
    }
    
    func addUnderline(lineColor: UIColor, isMultiline: Bool) {
        //Set lineBreakMode
        if(isMultiline) {
            self.numberOfLines = 0
        } else {
            self.sizeToFit()
        }
        
        //Set underline
        let yPos = self.frame.size.height + 5
        
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: 0, y: yPos))
        linePath.addLine(to: CGPoint(x: self.frame.size.width, y: yPos))
        
        let lineLayer = CAShapeLayer()
        lineLayer.path = linePath.cgPath
        lineLayer.fillColor = UIColor.clear.cgColor
        lineLayer.strokeColor = lineColor.cgColor
        lineLayer.lineWidth = 2.0
        layer.addSublayer(lineLayer)
    }
}
