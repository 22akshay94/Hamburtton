//
//  MenuButton.swift
//  CustomButton
//
//  Created by Mobikasa Macmini 1 on 11/5/18.
//  Copyright © 2018 mobikasa. All rights reserved.
//

import UIKit

class MenuButton: UIButton {
    
    private let animationView = AnimationView()
    private var isOpen: Bool = false
    
    @IBInspectable var lineColor: UIColor {
        get {
            return UIColor(cgColor: animationView.lineColor.cgColor)
        }
        set {
            animationView.lineColor = UIColor(cgColor: newValue.cgColor)
        }
    }
    
    @IBInspectable var lineThickness: CGFloat {
        get {
            return animationView.lineThickness
        }
        set {
            animationView.lineThickness = newValue
        }
    }
    
    @IBInspectable var lineCornerRadius:CGFloat {
        get {
            return animationView.lineCornerRadius
        }
        set {
            animationView.lineCornerRadius = newValue
        }
    }
    
    @IBInspectable var animationDuration: Double {
        get {
            return animationView.animationDuration
        }
        set {
            animationView.animationDuration = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        animationView.frame = self.bounds
        insertSubview(animationView, belowSubview: subviews[0])
        self.setTitle("", for: .normal)
        animationView.isUserInteractionEnabled = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    private func commonInit() {
        
        self.tintColor = .clear
        addTarget(self, action: #selector(animateView), for: .touchUpInside)
    }
    
    @objc func animateView() -> Void {
        
        isSelected = !isSelected
        animationView.animate(selected: isSelected)
    }
}
