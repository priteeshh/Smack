//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Preeteesh Remalli on 17/05/18.
//  Copyright © 2018 Preeteesh Remalli. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func closeBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: TO_UNWIND_CHANNEL, sender: nil)
    }
    

}
