//
//  ProfileVC.swift
//  ClothesStore
//
//  Created by mac on 12/08/2022.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var profileInfoView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

      updateUi()
    }
    private func updateUi(){
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileInfoView.layer.cornerRadius = 30
        profileInfoView.layer.maskedCorners = [.layerMinXMinYCorner , .layerMaxXMinYCorner]
    }
    

    

}
