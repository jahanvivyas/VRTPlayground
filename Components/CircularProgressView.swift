import UIKit

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi / 180 }
    var radiansToDegrees: Double { return Double(self) * 180 / .pi }
}

public class CircularProgressView: UIView {

    let strokeColor = UIColor(hexString: "#5dfc71")

    public var percentage:Int = 0{
        didSet {
            self.setNeedsLayout()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let image = UIImage(named: "play")
        let imageView = UIImageView(image: image!)
        imageView.frame = self.bounds
        self.addSubview(imageView)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    public override func draw(_ rect: CGRect) {
        let halfSize:CGFloat = min( bounds.size.width/2, bounds.size.height/2)
        let centerPoint:CGPoint = CGPoint(x: halfSize, y: halfSize)
        let radius = halfSize
        
        let endAngleInDegree = (percentage*360/100)-90
        
        let start = CGFloat(270 * M_PI/180)
        let end =  CGFloat(endAngleInDegree.degreesToRadians)
        
        let circlePath = UIBezierPath(arcCenter: centerPoint, radius: radius, startAngle: start, endAngle: end, clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.lineWidth = 2.0
        
        layer.addSublayer(shapeLayer)

        /*var progressBarEndAngle:CGFloat = 0;
        
        let percentage:CGFloat = 50;
        if (percentage==0)
        {
            progressBarEndAngle=270;
        }
        else
        {
            progressBarEndAngle=(percentage*360)-90;
            if (progressBarEndAngle==270)
            {
                progressBarEndAngle=269.9;
            }
        }
        
        let halfSize:CGFloat = min( bounds.size.width/2, bounds.size.height/2)
        let desiredLineWidth:CGFloat = 1    // your desired value
        let endAngle:CGFloat = progressBarEndAngle * CGFloat(M_PI)/180;
        
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x:halfSize,y:halfSize),
            radius: CGFloat( halfSize - (desiredLineWidth/2) ),
            startAngle: CGFloat(270 * M_PI/180),
            endAngle: endAngle,
            clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = desiredLineWidth
        
        layer.addSublayer(shapeLayer)*/
        
    }
}
