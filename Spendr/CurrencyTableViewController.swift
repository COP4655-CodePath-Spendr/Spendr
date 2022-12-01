//
//  CurrencyTableViewController.swift
//  Spendr
//
//  Created by Gina Victoria on 11/16/22.
//
// https://api.exchangerate.host/latest?base=\(base)&amount\(input)

import UIKit

class CurrencyTableViewController: UIViewController {
    
    @IBOutlet weak var btcPrice: UILabel!
    @IBOutlet weak var ethPrice: UILabel!
    @IBOutlet weak var usdPrice: UILabel!
    @IBOutlet weak var audPrice: UILabel!
    
    @IBOutlet weak var lastUpdatedPrice: UILabel!
    
    let urlString = "https://api.coingecko.com/api/v3/exchange_rates"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        fetchData()
        
        let timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(refreshData), userInfo: nil, repeats: true)
    }
    
    @objc func refreshData() -> Void
    {
        fetchData()
    }
    
    func fetchData()
    {
        let url = URL(string: urlString)
        let defaultSession = URLSession(configuration: .default)
        let dataTask = defaultSession.dataTask(with: url!)
        {
            (data: Data?, response: URLResponse?, error: Error?) in
            
            if (error != nil)
            {
                print(error!)
                return
            }
            
            do
            {
                let json = try JSONDecoder().decode(Rates.self, from:data!)
            }
            
            catch
            {
                print(error)
                return
            }
            
        }
        dataTask.resume()
    }
    
    func setPrices(currency: Currency)
    {
        DispatchQueue.main.async
        {
            self.btcPrice.text = self.formatPrice(currency.btc)
            self.ethPrice.text = self.formatPrice(currency.eth)
            self.usdPrice.text = self.formatPrice(currency.usd)
            self.audPrice.text = self.formatPrice(currency.aud)
            self.lastUpdatedPrice.text = self.formatDate(date: Date())
        }
    }
    
    func formatPrice(_ price: Price) -> String
    {
        return String(format: "%@ %.4f", price.unit, price.value)
    }
    
    func formatDate(date: Date) -> String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM y HH:mm:ss"
        return formatter.string(from: date)
    }
    
    struct Rates : Codable
    {
        let rates: Currency
    }
    
    struct Currency : Codable
    {
        let btc: Price
        let eth: Price
        let usd: Price
        let aud: Price
    }
    
    struct Price : Codable
    {
        let name: String
        let unit: String
        let value: Float
        let type: String
    }
    
    // MARK: - Table view data source
    
    //override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
    //    return 0
    //}
    
    //override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
    //    return 0
    //}
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
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

