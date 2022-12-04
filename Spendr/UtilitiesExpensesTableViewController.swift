//
//  UtilitiesExpensesTableViewController.swift
//  Spendr
//
//  Created by Gina Victoria on 11/22/22.
//

import UIKit
import Parse

class UtilitiesExpensesTableViewController: UITableViewController {
    
    
    @IBOutlet var utilitiesTableView: UITableView!
    var expenses = [PFObject]()
    let user = PFUser.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        utilitiesTableView.delegate = self
        utilitiesTableView.dataSource = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let query = PFQuery(className: "Expenses")
        query.includeKeys(["name", "amount", "date", "category", "notes", "user"])
        query.whereKey("category", equalTo: "Utilities")
        query.whereKey("user", equalTo: user as Any)
        query.findObjectsInBackground { (expenses, error) in
            self.expenses = expenses!
            self.utilitiesTableView.reloadData()
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return expenses.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UtilitiesExpTableViewCell") as! UtilitiesExpTableViewCell
        let sections = expenses[indexPath.section]
        let expense = sections["name"] as? String
        let amount = sections["amount"] as? Double
        let date = sections["date"] as? String
        let note = sections["notes"] as? String
        cell.UtilitiesExpenseLabel.text = expense
        cell.UtilitiesAmountLabel.text = amount!.formatted(.currency(code: "USD"))
        cell.UtilitiesDateLabel.text = date
        cell.UtilitiesNotesLabel.text = note

        // Configure the cell...

        return cell
    }
    

    @IBAction func doneButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
