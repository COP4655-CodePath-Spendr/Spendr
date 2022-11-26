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
    
    
    @IBOutlet weak var incomeLabel: UILabel!
    
    @IBOutlet weak var budgetLabel: UILabel!
    
    @IBOutlet weak var expensesLabel: UILabel!
    
    @IBOutlet weak var pieChart: PieChartView!
    
    let user = PFUser.current()
    let category = PFObject(className: "Categories")
    let expense = PFObject(className: "Expenses")
    

    var foodExpensesArray = [Double]()
    var homeExpensesArray = [Double]()
    var autoExpensesArray = [Double]()
    var utilitiesExpensesArray = [Double]()
    var MiscExpensesArray = [Double]()
    var otherExpensesArray = [Double]()
    var incomeArray = [Double]()
    
    var foodData = PieChartDataEntry(value: 0)
    var homeData = PieChartDataEntry(value: 0)
    var autoData = PieChartDataEntry(value: 0)
    var utilitiesData = PieChartDataEntry(value: 0)
    var MiscData = PieChartDataEntry(value: 0)
    var otherData = PieChartDataEntry(value: 0)
    var numberOfDownloads = [PieChartDataEntry]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let incomeTotal = getincomeAmount().reduce(0, +)
        
        let foodTotal = getFoodExpenses().reduce(0, +)
        let homeTotal = getHomeExpenses().reduce(0, +)
        let autoTotal = getAutoExpenses().reduce(0, +)
        let utilitiesTotal = getUtilitiesExpenses().reduce(0, +)
        let miscTotal = getMiscExpenses().reduce(0, +)
        let otherTotal = getOtherExpenses().reduce(0, +)
        
        let expensesTotal = foodTotal + homeTotal + autoTotal + utilitiesTotal + miscTotal + otherTotal
        
        let budget = incomeTotal - expensesTotal
        
        foodData.value = foodTotal
        foodData.label = "Food"
        
        homeData.value = homeTotal
        homeData.label = "Home"
        
        autoData.value = autoTotal
        autoData.label = "Auto"
        
        utilitiesData.value = utilitiesTotal
        utilitiesData.label = "Utilities"
        
        MiscData.value = miscTotal
        MiscData.label = "Miscellaneous"
        
        otherData.value = otherTotal
        otherData.label = "Other"
        
        numberOfDownloads = [foodData, homeData, autoData, utilitiesData, MiscData, otherData]
        updateChartData()
        
        self.incomeLabel.text = incomeTotal.formatted(.currency(code: "USD"))
        self.expensesLabel.text = expensesTotal.formatted(.currency(code: "USD"))
        if budget < 0 {
            self.budgetLabel.textColor = UIColor.red
            self.budgetLabel.text = budget.formatted(.currency(code: "USD"))
        }
        else {
            self.budgetLabel.textColor = UIColor.green
            self.budgetLabel.text = budget.formatted(.currency(code: "USD"))
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        
        
        
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
        
        let colors = [UIColor(named: "food"), UIColor(named: "home"), UIColor(named: "auto"), UIColor(named: "utilities"), UIColor(named: "misc"), UIColor(named: "other")]
        chartDataSets.colors = colors as! [NSUIColor]
        pieChart.data = chartData
        
    }
    

    
    
    
    
    func getFoodExpenses() -> [Double] {
        var sampleArray = [PFObject]()
        let query = PFQuery(className: "Expenses")
        query.whereKey("category", equalTo: "Food")
        query.whereKey("user", equalTo: user as Any)
        do {
            sampleArray = try query.findObjects()
        }
        catch {
            print(error)
        }
        for amount in sampleArray.map({$0.object(forKey: "amount")}){
            self.foodExpensesArray.append(amount as! Double)
        }
        //self.viewDidLoad()
        return self.foodExpensesArray
    }
    
    func getHomeExpenses() -> [Double] {
        var sampleArray = [PFObject]()
        let query = PFQuery(className: "Expenses")
        query.whereKey("category", equalTo: "Home")
        query.whereKey("user", equalTo: user as Any)
        do {
            sampleArray = try query.findObjects()
        }
        catch {
            print(error)
        }
        for amount in sampleArray.map({$0.object(forKey: "amount")}){
            self.homeExpensesArray.append(amount as! Double)
        }
        return self.homeExpensesArray
    }
    
    func getAutoExpenses() -> [Double] {
        var sampleArray = [PFObject]()
        let query = PFQuery(className: "Expenses")
        query.whereKey("category", equalTo: "Auto")
        query.whereKey("user", equalTo: user as Any)
        do {
            sampleArray = try query.findObjects()
        }
        catch {
            print(error)
        }
        for amount in sampleArray.map({$0.object(forKey: "amount")}){
            self.autoExpensesArray.append(amount as! Double)
        }
        return self.autoExpensesArray
    }
    
    func getUtilitiesExpenses() -> [Double] {
        var sampleArray = [PFObject]()
        let query = PFQuery(className: "Expenses")
        query.whereKey("category", equalTo: "Utilities")
        query.whereKey("user", equalTo: user as Any)
        do {
            sampleArray = try query.findObjects()
        }
        catch {
            print(error)
        }
        for amount in sampleArray.map({$0.object(forKey: "amount")}){
            self.utilitiesExpensesArray.append(amount as! Double)
        }
        return self.utilitiesExpensesArray
    }
    
    func getMiscExpenses() -> [Double] {
        var sampleArray = [PFObject]()
        let query = PFQuery(className: "Expenses")
        query.whereKey("category", equalTo: "Miscellaneous")
        query.whereKey("user", equalTo: user as Any)
        do {
            sampleArray = try query.findObjects()
        }
        catch {
            print(error)
        }
        for amount in sampleArray.map({$0.object(forKey: "amount")}){
            self.MiscExpensesArray.append(amount as! Double)
        }
        return self.MiscExpensesArray
    }
    
    func getOtherExpenses() -> [Double] {
        var sampleArray = [PFObject]()
        let query = PFQuery(className: "Expenses")
        query.whereKey("category", equalTo: "Other")
        query.whereKey("user", equalTo: user as Any)
        do {
            sampleArray = try query.findObjects()
        }
        catch {
            print(error)
        }
        for amount in sampleArray.map({$0.object(forKey: "amount")}){
            self.otherExpensesArray.append(amount as! Double)
        }
        return self.otherExpensesArray
    }
    
    func getincomeAmount() -> [Double] {
        var sampleArray = [PFObject]()
        let query = PFQuery(className: "Income")
        query.whereKey("user", equalTo: user as Any)
        do {
            sampleArray = try query.findObjects()
        }
        catch {
            print(error)
        }
        for amount in sampleArray.map({$0.object(forKey: "amount")}){
            self.incomeArray.append(amount as! Double)
        }
        return self.incomeArray
    }
}
