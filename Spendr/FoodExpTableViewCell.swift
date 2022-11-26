//
//  FoodExpTableViewCell.swift
//  Spendr
//
//  Created by Gina Victoria on 11/22/22.
//

import UIKit

class FoodExpTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var foodExpenseLabel: UILabel!
    
    
    @IBOutlet weak var foodExpenseDateLabel: UILabel!
    
    @IBOutlet weak var foodExpenseAmountLabel: UILabel!
    
    
    @IBOutlet weak var foodExpenseNotesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
