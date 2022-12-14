//
//  AddIncomeViewController.swift
//  Spendr
//
//  Created by Gina Victoria on 11/10/22.
//

import UIKit
import Parse
import iOSDropDown

class AddIncomeViewController: UIViewController {

    @IBOutlet weak var incomeInput: UITextField!
    @IBOutlet weak var incomeLabel: UILabel!

    @IBOutlet weak var addIncomeStatusLabel: UILabel!
    
    //var incomes = [PFObject]()
    let income = PFObject(className: "Income")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    @IBAction func addIncomeButton(_ sender: Any) {
        income["amount"] = Double(incomeInput.text!)
        income["user"] = PFUser.current()
        
        income.saveInBackground { (success, error) in
            if success {
                print("Saved!")
                self.addIncomeStatusLabel.textColor = UIColor.green
                self.addIncomeStatusLabel.text = "Added!"
                self.incomeInput.text = ""
            }
            else {
                print("Error.")
                self.addIncomeStatusLabel.textColor = UIColor.red
                self.addIncomeStatusLabel.text = "Error. Try Again."
            }
        }
    }
    
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func doneButton(_ sender: Any) {
        self.performSegue(withIdentifier: "dashboardSegue", sender: nil)
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
