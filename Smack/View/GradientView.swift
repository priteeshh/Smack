//
//  GradientView.swift
//  Smack
//
//  Created by Preeteesh Remalli on 17/05/18.
//  Copyright © 2018 Preeteesh Remalli. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {
    @IBInspectable var topColor : UIColor = UIColor.blue {
        didSet {
            self.setNeedsLayout()
        }
    }
    @IBInspectable var bottomColor : UIColor = UIColor.green {
        didSet {
            self.setNeedsLayout()
        }
    }

    override func layoutSubviews() {
        let gradentLayer = CAGradientLayer()
        gradentLayer.colors = [topColor.cgColor,bottomColor.cgColor]
        gradentLayer.startPoint = CGPoint(x: 0, y: 0)
        gradentLayer.endPoint = CGPoint(x: 1, y: 1)
        gradentLayer.frame = self.bounds
        self.layer.insertSublayer(gradentLayer, at: 0)
   
    }
}
