//
//  ProfileVC.swift
//  ClothesStore
//
//  Created by Ahmed Atef on 12/08/2022.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var profileInfoView: UIView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var email: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

      updateUi()
    setuserInfo()
    }
    private func updateUi(){
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileInfoView.layer.cornerRadius = 30
        profileInfoView.layer.maskedCorners = [.layerMinXMinYCorner , .layerMaxXMinYCorner]
        self.navigationItem.setHidesBackButton(true, animated: true);

    }
    

    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        zeroCart()
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "logIn")
        present(loginVC, animated: true, completion: nil)
    }
    
    private func setuserInfo(){
        userName.text = theUser.name
        email.text = theUser.email
    }
    
}
