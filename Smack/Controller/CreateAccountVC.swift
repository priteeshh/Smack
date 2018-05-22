//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Preeteesh Remalli on 17/05/18.
//  Copyright © 2018 Preeteesh Remalli. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    //Outlets
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    //Varibles
    var avatarName = "profileDefault"
    var avatarColor = "[0.5,0.5,0.5,1]"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if UserDataService.instance.avatarName != ""{
        profileImage.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
        }
    }
    @IBAction func genrateBackGroundBtnTapped(_ sender: Any) {
    }
    @IBAction func createAccount(_ sender: Any) {
        guard let name = userNameTxt.text, userNameTxt.text != "" else {return}
        guard  let email = emailTxt.text, emailTxt.text != "" else {return}
        guard let pass = passwordTxt.text, passwordTxt.text != "" else {return}
        AuthServices.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                AuthServices.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                    if success{
                        print(UserDataService.instance.avatarName,UserDataService.instance.name)
                        self.performSegue(withIdentifier: TO_UNWIND_CHANNEL, sender: nil)
                    }
                })
            }
        }
        
    }
    @IBAction func chooseAvatarBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    @IBAction func closeBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: TO_UNWIND_CHANNEL, sender: nil)
    }
    

}
