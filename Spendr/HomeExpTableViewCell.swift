//
//  HomeExpTableViewCell.swift
//  Spendr
//
//  Created by Gina Victoria on 11/25/22.
//

import UIKit

class HomeExpTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var HomeExpenseLabel: UILabel!
    
    @IBOutlet weak var HomeExpensesAmountLabel: UILabel!
    
    
    @IBOutlet weak var HomeExpensesDateLabel: UILabel!
    
    
    @IBOutlet weak var HomeExpensesNotesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
