//
//  UtilitiesExpTableViewCell.swift
//  Spendr
//
//  Created by Gina Victoria on 11/25/22.
//

import UIKit

class UtilitiesExpTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var UtilitiesExpenseLabel: UILabel!
    
    
    @IBOutlet weak var UtilitiesAmountLabel: UILabel!
    
    
    @IBOutlet weak var UtilitiesDateLabel: UILabel!
    
    @IBOutlet weak var UtilitiesNotesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
