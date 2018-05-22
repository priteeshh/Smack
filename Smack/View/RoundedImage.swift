//
//  RoundedImage.swift
//  Smack
//
//  Created by Preeteesh Remalli on 22/05/18.
//  Copyright © 2018 Preeteesh Remalli. All rights reserved.
//

import UIKit
@IBDesignable
class RoundedImage: UIImageView {

    override func awakeFromNib() {
        setView()
    }
    func setView(){
    self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
 }
    override func prepareForInterfaceBuilder() {
        self.prepareForInterfaceBuilder()
    }
}
