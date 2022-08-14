//
//  register.swift
//  ClothesStore
//
//  Created by macbook pro on 13/08/2022.
//

import UIKit

class register: UIViewController {

    @IBOutlet weak var nameSignUp: UITextField!
    @IBOutlet weak var emailSignUp: UITextField!
    @IBOutlet weak var passwordSignUp: UITextField!
    @IBOutlet weak var cPasswordSignUp: UITextField!
    @IBOutlet weak var phoneNum: UITextField!
    @IBOutlet weak var addressSignUp: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signUpButton(_ sender: Any) {
        
        guard let name = nameSignUp.text, name != ""
        else{ showAlert(msg: "Please enter your email!",vc:self)
                return
        }
        guard let email = emailSignUp.text, let pass = passwordSignUp.text, email != "" && pass != ""
        else{ showAlert(msg: "Please enter your email & password!",vc:self)
                return
        }
        guard let email = emailSignUp.text, email != ""
        else{ showAlert(msg: "Please enter your email!",vc:self)
                return
        }
        guard let pass = passwordSignUp.text, pass != ""
        else{ showAlert(msg: "Please enter your password!",vc:self)
            return
        }
        guard let cpass = cPasswordSignUp.text, pass == cpass
        else{ showAlert(msg: "Please confirm your password right!",vc:self)
            return
        }
        guard let address = addressSignUp.text, address != ""
        else{ showAlert(msg: "Please enter your email!",vc:self)
                return
        }
        guard let phoneNum = phoneNum.text, phoneNum != ""
        else{ showAlert(msg: "Please enter your email!",vc:self)
                return
        }
        
        InsertUser(email: email, password: pass, address: address, phoneNum: Int(phoneNum)!, name: name)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
