//
//  AvatarPickerVC.swift
//  Smack
//
//  Created by Preeteesh Remalli on 21/05/18.
//  Copyright © 2018 Preeteesh Remalli. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var pickerCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerCollectionView.delegate = self
        pickerCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = pickerCollectionView.dequeueReusableCell(withReuseIdentifier: "avatarCell", for: indexPath) as? AvatarCell{
            return cell
        }
        return AvatarCell()
    }
    @IBAction func pickerBackBtnTapped(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pickerSegmentControllerChanger(_ sender: Any) {
    }
    

}
