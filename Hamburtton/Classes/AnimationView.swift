//
//  AnimationView.swift
//  CustomButton
//

import UIKit

class AnimationView: UIView {
    
    var lineColor: UIColor = UIColor.black
    var lineCornerRadius: CGFloat = 2.5
    var lineThickness: CGFloat = 5
    var animationDuration: TimeInterval = 0.15
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var topLbl: UILabel!
    @IBOutlet weak var middleLbl: UILabel!
    @IBOutlet weak var bottomLbl: UILabel!
    
    @IBOutlet weak var topLblHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var middleLblHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomLblHeightConstraint: NSLayoutConstraint!
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        topLbl.backgroundColor = lineColor
        middleLbl.backgroundColor = lineColor
        bottomLbl.backgroundColor = lineColor
        
        topLbl.layer.masksToBounds = true
        middleLbl.layer.masksToBounds = true
        bottomLbl.layer.masksToBounds = true
        
        topLbl.layer.cornerRadius = lineCornerRadius
        middleLbl.layer.cornerRadius = lineCornerRadius
        bottomLbl.layer.cornerRadius = lineCornerRadius
        
        topLblHeightConstraint.constant = lineThickness
        middleLblHeightConstraint.constant = lineThickness
        bottomLblHeightConstraint.constant = lineThickness
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    private func commonInit() {
        let bundle = Bundle.init(for: AnimationView.self)
        bundle.loadNibNamed("AnimationView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.backgroundColor = .clear
    }
    
    internal func animate(selected: Bool) -> Void {
        if selected == true {
            
            UIView.animate(withDuration: animationDuration, animations: {
                self.topLbl.center.y += self.frame.height/4
                self.bottomLbl.center.y -= self.frame.height/4
            }) { (_) in
                UIView.animate(withDuration: self.animationDuration, animations: {
                    self.middleLbl.isHidden = true
                    self.topLbl.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/4)
                    self.bottomLbl.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
                })
            }
        } else {
            UIView.animate(withDuration: animationDuration, animations: {
                self.topLbl.transform = .identity
                self.bottomLbl.transform = .identity
            }) { (_) in
                UIView.animate(withDuration: self.animationDuration, animations: {
                    self.middleLbl.isHidden = false
                    self.topLbl.center.y -= self.frame.height/4
                    self.bottomLbl.center.y += self.frame.height/4
                })
            }
        }
    }
}
