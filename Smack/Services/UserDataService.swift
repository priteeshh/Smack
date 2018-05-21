//
//  UserDataService.swift
//  Smack
//
//  Created by Preeteesh Remalli on 21/05/18.
//  Copyright © 2018 Preeteesh Remalli. All rights reserved.
//

import Foundation

class UserDataService{
    static let instance = UserDataService()
    
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    func userData(id: String, avatarColor : String, avatarName : String, email : String, name : String){
        self.id = id
        self.avatarColor = avatarColor
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    func setAvatarName(avatarName : String) {
        self.avatarName = avatarName
    }
    
}
