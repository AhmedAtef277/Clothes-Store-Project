//
//  ViewController.swift
//  ClothesStore
//
//  Created by mac on 11/08/2022.
//

import UIKit
var userId:Int = 0

func showAlert(msg:String, vc:UIViewController)
{
    let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    vc.present(alert,animated: true,completion: nil)
}

class ViewController: UIViewController {

    
    @IBOutlet weak var emailLogIn: UITextField!
    @IBOutlet weak var passwordLogIn: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Hi")
        signInButton.layer.cornerRadius = 15
        
        
    }
    @IBAction func logInButton(_ sender: Any) {
         guard let email = emailLogIn.text, let pass = passwordLogIn.text, email != "" && pass != ""
        else{ showAlert(msg: "Please enter your email & password!",vc:self)
                 return
         }
         guard let email = emailLogIn.text, email != ""
             else{ showAlert(msg: "Please enter your email!",vc:self)
                 return
         }
         guard let pass = passwordLogIn.text, pass != ""
         else{ showAlert(msg: "Please enter your password!",vc:self)
             return
         }
        
        if userExists(email: email, password: pass) == -1
        {
            showAlert(msg: "Your email or password are'nt correct try again!",vc:self)
        }
        else
        {
            // move to the menu screen with user's Id
            
        }
    }
    
    
    
    

        
        
}

