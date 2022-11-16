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
    
    var categories = [PFObject]()
    let category = PFObject(className: "Categories")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
