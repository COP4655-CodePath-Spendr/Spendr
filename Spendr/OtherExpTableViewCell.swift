//
//  OtherExpTableViewCell.swift
//  Spendr
//
//  Created by Gina Victoria on 11/25/22.
//

import UIKit

class OtherExpTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var OtherExpenseLabel: UILabel!
    
    @IBOutlet weak var OtherAmountLabel: UILabel!
    
    @IBOutlet weak var OtherDateLabel: UILabel!
    
    
    @IBOutlet weak var OtherNotesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
