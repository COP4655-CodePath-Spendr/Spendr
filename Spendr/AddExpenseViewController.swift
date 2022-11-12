//
//  AddExpenseViewController.swift
//  Spendr
//
//  Created by Gina Victoria on 11/11/22.
//

import UIKit
import Parse
import iOSDropDown

class AddExpenseViewController: UIViewController {
    
    
    @IBOutlet weak var newExpenseName: UITextField!
    @IBOutlet weak var newExpenseNotes: UITextField!
    @IBOutlet weak var newExpenseDate: UITextField!
    @IBOutlet weak var newExpenseAmount: UITextField!
    @IBOutlet weak var newExpenseCategory: UITextField!
    @IBOutlet weak var addExpenseStatus: UILabel!
    
    var expenses = [PFObject]()
    let expense = PFObject(className: "Expenses")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addExpenseButton(_ sender: Any) {
        expense["name"] = newExpenseName.text
        expense["category"] = newExpenseCategory.text
        expense["amount"] = Double(newExpenseAmount.text!)
        expense["date"] = newExpenseDate.text
        expense["notes"] = newExpenseNotes.text
        expense["user"] = PFUser.current()
        
        expense.saveInBackground { (success, error) in
            if success {
                print("Saved!")
                self.addExpenseStatus.textColor = UIColor.green
                self.addExpenseStatus.text = "Added!"
                self.newExpenseName.text = ""
                self.newExpenseCategory.text = ""
                self.newExpenseAmount.text = ""
                self.newExpenseDate.text = ""
                self.newExpenseNotes.text = ""
                //self.dismiss(animated: true, completion: nil)
            }
            else {
                print("Error.")
                self.addExpenseStatus.textColor = UIColor.red
                self.addExpenseStatus.text = "Error. Try Again."
            }
        }
    }
    
    @IBAction func cancelAddExpenseButton(_ sender: Any) {
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
