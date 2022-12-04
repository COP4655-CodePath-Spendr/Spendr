//
//  ViewCategoryViewController.swift
//  Spendr
//
//  Created by Gina Victoria on 11/11/22.
//

import UIKit

class ViewCategoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func foodExpensesButton(_ sender: Any) {
        self.performSegue(withIdentifier: "foodExpensesSegue", sender: nil)
    }
    
    
    @IBAction func autoExpensesButton(_ sender: Any) {
        self.performSegue(withIdentifier: "autoExpensesSegue", sender: nil)
    }
    
    @IBAction func homeExpensesButton(_ sender: Any) {
        self.performSegue(withIdentifier: "homeExpensesSegue", sender: nil)
    }
    
    
    @IBAction func utilitiesExpensesButton(_ sender: Any) {
        self.performSegue(withIdentifier: "utilitiesExpensesSegue", sender: nil)
    }
    
    
    @IBAction func miscExpensesButton(_ sender: Any) {
        self.performSegue(withIdentifier: "miscExpensesSegue", sender: nil)
    }
    
    
    @IBAction func otherExpensesButton(_ sender: Any) {
        self.performSegue(withIdentifier: "otherExpensesSegue", sender: nil)
    }
    
    
    @IBAction func doneButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
