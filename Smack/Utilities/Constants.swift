//
//  Constants.swift
//  Smack
//
//  Created by Preeteesh Remalli on 17/05/18.
//  Copyright © 2018 Preeteesh Remalli. All rights reserved.
//

import Foundation

typealias complitionHandler = (_ Success: Bool) -> ()

// URL Constants
let BASE_URL = "https://smackappdb.herokuapp.com/v1"
let URL_REGISTER = "\(BASE_URL)/account/register"
let URL_LOGIN = "\(BASE_URL)/account/login"
let URL_USER_ADD = "\(BASE_URL)/user/add"
//Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let TO_UNWIND_CHANNEL = "toUnwindToChannel"
//UserDefaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedin"
let USER_EMAIL = "userEmail"
//Header
let HEADER = [
    "Content-Type" : "application/json; charset=utf-8"
]
