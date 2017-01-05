//
//  ViewController.swift
//  Components
//
//  Created by Jahanvi Vyas on 20/12/2016.
//  Copyright © 2016 Jahanvi Vyas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.black
        
        let progressView = CircularProgressView.init(frame: CGRect.init(x: 200, y: 150, width: 40, height: 40))
        progressView.percentage = 50;
        self.view.addSubview(progressView)
        
        let linkButton = LinkButton.init(frame: CGRect(x: 10, y: 50, width: 100, height: 60))
        linkButton.setTitle("vrt custom button", for: UIControlState.normal)
        //linkButton.setLayout(isMultiline: true, lineColor:UIColor.green, textColor: UIColor.white)
        linkButton.addUnderLine(lineColor: UIColor.green, textColor: UIColor.white, isMultiline: false)
        self.view.addSubview(linkButton)
        
        let label = UILabel(frame: CGRect(x: 200, y: 200, width: 100, height: 30))
        label.text = "Add Label"
        label.textColor = UIColor.white
        label.addImage(imageName: "drop-yellow")
        self.view.addSubview(label)
        
        let label1 = UILabel(frame: CGRect(x: 200, y: 500, width: 100, height: 35))
        label1.text = "This is a label"
        label1.textColor = UIColor.white
        label1.addUnderline(lineColor: UIColor.red, isMultiline: false)
        self.view.addSubview(label1)
        
        self.segmentedControl.styleBorders(color: UIColor(hexString: "#ebebeb"))
        
        let styleButton = UIButton(frame: CGRect(x: 100, y: 350, width: 200, height: 30))
        styleButton.setTitle("Button", for: UIControlState.normal)
        styleButton.addBorder(borderColor: UIColor.yellow)
        self.view.addSubview(styleButton)
    }
}

