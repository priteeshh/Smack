//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Preeteesh Remalli on 17/05/18.
//  Copyright © 2018 Preeteesh Remalli. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    @IBOutlet weak var userNameTxt: UITextField!
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func genrateBackGroundBtnTapped(_ sender: Any) {
    }
    @IBAction func createAccount(_ sender: Any) {
        guard  let email = emailTxt.text, emailTxt.text != "" else {
            return
        }
        guard let pass = passwordTxt.text, passwordTxt.text != "" else {
            return
        }
        AuthServices.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                print("registraton success")
            }
        }
        
    }
    @IBAction func chooseAvatarBtnTapped(_ sender: Any) {
    }
    @IBAction func closeBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: TO_UNWIND_CHANNEL, sender: nil)
    }
    

}
