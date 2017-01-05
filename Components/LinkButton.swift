//
//  LinkButton.swift
//  Components
//
//  Created by Jahanvi Vyas on 20/12/2016.
//  Copyright © 2016 Jahanvi Vyas. All rights reserved.
//

import UIKit

class LinkButton: UIButton {
    
    var lineColor:UIColor
    
    override init(frame: CGRect) {
        lineColor = UIColor.green
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout(isMultiline:Bool, lineColor:UIColor, textColor:UIColor) {
        if(isMultiline)
        {
            self.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
            self.titleLabel?.textAlignment = NSTextAlignment.center
        }
        else
        {
            self.sizeToFit()
        }
        self.setTitleColor(textColor, for: UIControlState.normal)
        self.lineColor = lineColor
    }
    
    override func draw(_ rect: CGRect) {
        
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: 0, y: self.frame.size.height))
        linePath.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        linePath.lineWidth = 4.0;
        linePath.close()
        
        lineColor.set()
        linePath.stroke()
    }

}
