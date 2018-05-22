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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    //Varibles
    var avatarName = "profileDefault"
    var avatarColor = "[0.5,0.5,0.5,1]"
    var bgColor :UIColor?
    override func viewDidLoad() {
        super.viewDidLoad()
       setUpVIew()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if UserDataService.instance.avatarName != ""{
        profileImage.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
        }
        if avatarName.contains("light") && bgColor == nil{
            profileImage.backgroundColor = UIColor.lightGray
        }
    }
    @IBAction func genrateBackGroundBtnTapped(_ sender: Any) {
        let r  = CGFloat(arc4random_uniform(255))/255
        let g  = CGFloat(arc4random_uniform(255))/255
        let b  = CGFloat(arc4random_uniform(255))/255
        bgColor = UIColor(displayP3Red: r, green: g, blue: b, alpha: 1)
        UIView.animate(withDuration: 0.5){
            self.profileImage.backgroundColor = self.bgColor
        }
        
    }
    @IBAction func createAccount(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        guard let name = userNameTxt.text, userNameTxt.text != "" else {return}
        guard  let email = emailTxt.text, emailTxt.text != "" else {return}
        guard let pass = passwordTxt.text, passwordTxt.text != "" else {return}
        AuthServices.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                AuthServices.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                    if success{
                        self.spinner.isHidden = true
                        self.spinner.stopAnimating()
                        print(UserDataService.instance.avatarName,UserDataService.instance.name)
                        self.performSegue(withIdentifier: TO_UNWIND_CHANNEL, sender: nil)
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
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
    
    func setUpVIew(){
        spinner.isHidden = true
        userNameTxt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceHolder])
        passwordTxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceHolder])
        emailTxt.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceHolder])
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    @objc func handleTap(){
        self.view.endEditing(true)
    }
    
}
