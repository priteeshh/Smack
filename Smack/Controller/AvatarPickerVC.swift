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
    @IBOutlet weak var segmentControl: UISegmentedControl!
    var avatarType = AvatarType.dark
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
            cell.configureCell(index: indexPath.item, avatarType: avatarType)
            return cell
        }
        return AvatarCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if avatarType == AvatarType.dark{
            UserDataService.instance.setAvatarName(avatarName: "dark\(indexPath.item)")
        }else{
            UserDataService.instance.setAvatarName(avatarName: "light\(indexPath.item)")
        }
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func pickerBackBtnTapped(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pickerSegmentControllerChanger(_ sender: Any) {
        if segmentControl.selectedSegmentIndex == 0{
            avatarType = AvatarType.dark
        }
        else{
            avatarType = AvatarType.light
        }
        pickerCollectionView.reloadData()
        
    }
    

}
