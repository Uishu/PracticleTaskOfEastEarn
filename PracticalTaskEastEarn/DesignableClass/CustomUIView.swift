//
//  CustomUIView.swift
//  PracticalTaskEastEarn
//
//  Created by Disha on 26/02/24.
//

import UIKit

class CustomUIView: UIView {

    override func awakeFromNib() {
        self.layer.masksToBounds = cornerRadius > 0
    }

    @IBInspectable var useDefaultRadius: Bool = true {
        didSet {
            self.layer.masksToBounds = cornerRadius > 0
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            self.layer.cornerRadius = newValue

        }
        get {
            if (useDefaultRadius) {
                    // Set default radius
                    self.layer.cornerRadius = 23
                }

            return self.layer.cornerRadius
        }
    }

    @IBInspectable var addShadow:Bool = true{

        didSet(newValue) {
            if(newValue == true){
                self.layer.masksToBounds = false
                self.layer.shadowColor = UIColor.black.cgColor
                self.layer.shadowOpacity = 0.5
                self.layer.shadowOffset = CGSize(width: 2, height: 3)
                self.layer.shadowRadius = 3

                self.layer.shadowPath = UIBezierPath(rect: bounds).cgPath
                self.layer.shouldRasterize = true
                self.layer.rasterizationScale =  UIScreen.main.scale
                print("trying to use shadow")
            }
        }

    }


}
@IBDesignable
class GradientImageView: UIView{
    @IBInspectable var firstColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    @IBInspectable var secondColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    func updateView() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [firstColor, secondColor].map{$0.cgColor}
    }
}
@IBDesignable
class CornerView: UIView {
    
    @IBInspectable var leftTopRadius : CGFloat = 0{
        didSet{
            self.applyMask()
        }
    }
    @IBInspectable var rightTopRadius : CGFloat = 0{
        didSet{
            self.applyMask()
        }
    }
    @IBInspectable var rightBottomRadius : CGFloat = 0{
        didSet{
            self.applyMask()
        }
    }
    
    @IBInspectable var leftBottomRadius : CGFloat = 0{
        didSet{
            self.applyMask()
        }
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.applyMask()
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    /*override func draw(_ rect: CGRect) {
        super.draw(rect)

    }*/
    
    func applyMask()
    {
        let shapeLayer = CAShapeLayer(layer: self.layer)
        shapeLayer.path = self.pathForCornersRounded(rect:self.bounds).cgPath
        shapeLayer.frame = self.bounds
        shapeLayer.masksToBounds = true
        self.layer.mask = shapeLayer
    }
    
    func pathForCornersRounded(rect:CGRect) ->UIBezierPath
    {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0 + leftTopRadius , y: 0))
        path.addLine(to: CGPoint(x: rect.size.width - rightTopRadius , y: 0))
        path.addQuadCurve(to: CGPoint(x: rect.size.width , y: rightTopRadius), controlPoint: CGPoint(x: rect.size.width, y: 0))
        path.addLine(to: CGPoint(x: rect.size.width , y: rect.size.height - rightBottomRadius))
        path.addQuadCurve(to: CGPoint(x: rect.size.width - rightBottomRadius , y: rect.size.height), controlPoint: CGPoint(x: rect.size.width, y: rect.size.height))
        path.addLine(to: CGPoint(x: leftBottomRadius , y: rect.size.height))
        path.addQuadCurve(to: CGPoint(x: 0 , y: rect.size.height - leftBottomRadius), controlPoint: CGPoint(x: 0, y: rect.size.height))
        path.addLine(to: CGPoint(x: 0 , y: leftTopRadius))
        path.addQuadCurve(to: CGPoint(x: 0 + leftTopRadius , y: 0), controlPoint: CGPoint(x: 0, y: 0))
        path.close()
        
        return path
    }
    
}
