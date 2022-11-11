//
//  DashboardViewController.swift
//  Spendr
//
//  Created by Gina Victoria on 11/9/22.
//

import UIKit
import Parse
import Charts

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var pieChart: PieChartView!
    
    var iosData = PieChartDataEntry(value: 0)
    var macData = PieChartDataEntry(value: 0)
    var numberOfDownloads = [PieChartDataEntry]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        iosData.value = 40
        iosData.label = "Example 1"
        
        macData.value = 50
        macData.label = "Example 2"
        
        numberOfDownloads = [iosData, macData]
        updateChartData()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let LoginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        guard let windowScene  = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else {return}
        delegate.window?.rootViewController = LoginViewController
    }
    
    
    
    
    @IBAction func addIncome(_ sender: Any) {
        self.performSegue(withIdentifier: "addIncomeSegue", sender: nil)
    }
    
    
    @IBAction func addExpense(_ sender: Any) {
        self.performSegue(withIdentifier: "addExpenseSegue", sender: nil)
    }
    
    
    
    @IBAction func addCategory(_ sender: Any) {
        self.performSegue(withIdentifier: "addCategorySegue", sender: nil)
    }
    
    
    @IBAction func viewCategory(_ sender: Any) {
        self.performSegue(withIdentifier: "viewCategorySegue", sender: nil)
    }
    
    
    func updateChartData() {
        let chartDataSets = PieChartDataSet(entries: numberOfDownloads, label: "")
        let chartData = PieChartData(dataSet: chartDataSets)
        
        let colors = [UIColor(named: "cat1"), UIColor(named: "cat2")]
        chartDataSets.colors = colors as! [NSUIColor]
        
        pieChart.data = chartData
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
