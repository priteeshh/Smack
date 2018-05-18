//
//  RoundedCornerButton.swift
//  Smack
//
//  Created by Preeteesh Remalli on 18/05/18.
//  Copyright © 2018 Preeteesh Remalli. All rights reserved.
//

import UIKit
@IBDesignable
class RoundedCornerButton: UIButton {

    @IBInspectable var cornerRadiuss : CGFloat = 3.0 {
        didSet {
            self.layer.cornerRadius = cornerRadiuss
        }
    }
    override func awakeFromNib() {
        self.setupView()
    }
    override func prepareForInterfaceBuilder() {
        self.prepareForInterfaceBuilder()
        self.setupView()
    }
    func setupView(){
        self.layer.cornerRadius = cornerRadiuss
    }

}
