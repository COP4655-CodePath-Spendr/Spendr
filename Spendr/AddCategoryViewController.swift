//
//  AddCategoryViewController.swift
//  Spendr
//
//  Created by Gina Victoria on 11/11/22.
//

import UIKit
import Parse
import iOSDropDown

class AddCategoryViewController: UIViewController {
    
    @IBOutlet weak var newCategoryName: UITextField!
    @IBOutlet weak var newCategoryNotes: UITextField!
    @IBOutlet weak var newCategoryColor: UITextField!
    
    @IBOutlet weak var newCategoryStatus: UILabel!
    
    var categories = [PFObject]()
    let category = PFObject(className: "Categories")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addCategoryButton(_ sender: Any) {
        category["category"] = newCategoryName.text
        category["color"] = newCategoryColor.text
        category["notes"] = newCategoryNotes.text
        category["user"] = PFUser.current()
        
        category.saveInBackground { (success, error) in
            if success {
                print("Saved!")
                self.newCategoryStatus.textColor = UIColor.green
                self.newCategoryStatus.text = "Added!"
                self.newCategoryName.text = ""
                self.newCategoryColor.text = ""
                self.newCategoryNotes.text = ""
            }
            else {
                print("Error.")
                self.newCategoryStatus.textColor = UIColor.red
                self.newCategoryStatus.text = "Error. Try Again."
            }
        }
    }
    
    @IBAction func cancelAddCategoryButton(_ sender: Any) {
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
