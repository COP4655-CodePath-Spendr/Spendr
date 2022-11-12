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
    
    @IBOutlet weak var monthDropdown: DropDown!
    
    var incomes = [PFObject]()
    let income = PFObject(className: "Income")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        monthDropdown.optionArray = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
        let amount = income["amount"]
        self.incomeLabel.text = amount as? String
//        let query = PFQuery(className: "Income")
//        query.includeKey("amount")
//        query.findObjectsInBackground { (incomes, error) in
//            if incomes != nil {
//                self.incomes = incomes!
//
//            }
//        }
    }
    
    @IBAction func addIncomeButton(_ sender: Any) {
        income["amount"] = Double(incomeInput.text!)
        income["month"] = monthDropdown.text
        income["user"] = PFUser.current()
        
        income.saveInBackground { (success, error) in
            if success {
                print("Saved!")
                self.addIncomeStatusLabel.textColor = UIColor.green
                self.addIncomeStatusLabel.text = "Added!"
                self.monthDropdown.text = ""
                self.incomeInput.text = ""
                //self.dismiss(animated: true, completion: nil)
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
