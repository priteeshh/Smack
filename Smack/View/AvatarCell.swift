//
//  AvatarCell.swift
//  Smack
//
//  Created by Preeteesh Remalli on 21/05/18.
//  Copyright © 2018 Preeteesh Remalli. All rights reserved.
//

import UIKit
enum AvatarType {
    case dark
    case light
}
class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    func configureCell(index: Int,avatarType: AvatarType){
        if avatarType == AvatarType.dark{
            avatarImage.image = UIImage(named: "dark\(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor
        }else{
            avatarImage.image = UIImage(named: "light\(index)")
            self.layer.backgroundColor = UIColor.gray.cgColor
        }
    }
    func setUpView(){
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
}
