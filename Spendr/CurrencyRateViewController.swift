//
//  CurrencyRateViewController.swift
//  Spendr
//
//  Created by Gina Victoria on 12/1/22.
//

import UIKit
import Foundation

class CurrencyRateViewController: UIViewController {
    
    @IBOutlet weak var todaysDate: UILabel!
    
    @IBOutlet weak var usdLabel: UILabel!
    
    @IBOutlet weak var btcLabel: UILabel!
    
    @IBOutlet weak var gbpLabel: UILabel!
    
    @IBOutlet weak var eurLabel: UILabel!
    
    @IBOutlet weak var chfLabel: UILabel!
    
    @IBOutlet weak var jpyLabel: UILabel!
    
    @IBOutlet weak var audLabel: UILabel!
    
    var currencies: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonData = getRequest().data(using: .utf8)!

        struct LatestCurrencies: Codable {
            let base: String
            let date: String
            let rates: Rates
            let success: Bool
            let timestamp: Int
        }

        struct Rates: Codable {
            let USD: Double
            let BTC : Double
            let GBP : Double
            let EUR: Double
            let JPY: Double
            let CHF: Double
            let AUD: Double

        }
        let results = try! JSONDecoder().decode(LatestCurrencies.self, from: jsonData)

        todaysDate.text = "As of: \(results.date)"
        usdLabel.text = String(results.rates.USD)
        btcLabel.text = String(results.rates.BTC)
        gbpLabel.text = String(results.rates.GBP)
        eurLabel.text = String(results.rates.EUR)
        chfLabel.text = String(results.rates.CHF)
        jpyLabel.text = String(results.rates.JPY)
        audLabel.text = String(results.rates.AUD)

        // Do any additional setup after loading the view.
    }
    
    func getRequest() -> String {
        
        let semaphore = DispatchSemaphore (value: 0)
        
        let url = "https://api.apilayer.com/exchangerates_data/latest?symbols=USD%2CBTC%2CGBP%2CEUR%2CJPY%2CCHF%2CAUD&base=USD"
        var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        request.addValue("88H7xp2vcuFZRzitaEY8Pm26QrwOAXc5", forHTTPHeaderField: "apikey")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
            self.currencies = String(data: data, encoding: .utf8)!
            semaphore.signal()
        }

        task.resume()
        semaphore.wait()
        return self.currencies
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
