//
//  LoginViewController.swift
//  Spendr
//
//  Created by Gina Victoria on 11/1/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBOutlet weak var errorMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLogin(_ sender: Any) {
       let username = usernameField.text!
       let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground:username, password:password) {
          (user, error) -> Void in
          if user != nil {
              self.performSegue(withIdentifier: "loginSegue", sender: nil)
          } else {
              print("Error: \(String(describing: error?.localizedDescription))")
              self.errorMessage.text = error?.localizedDescription
          }
        }
    }
    
    
    @IBAction func onSignup(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    

}

