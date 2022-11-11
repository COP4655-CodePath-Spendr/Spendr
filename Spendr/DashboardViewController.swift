//
//  DashboardViewController.swift
//  Spendr
//
//  Created by Gina Victoria on 11/9/22.
//

import UIKit
import Parse

class DashboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let LoginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        guard let windowScene  = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else {return}
        delegate.window?.rootViewController = LoginViewController
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
