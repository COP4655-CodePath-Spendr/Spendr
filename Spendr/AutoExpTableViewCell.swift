//
//  AutoExpTableViewCell.swift
//  Spendr
//
//  Created by Gina Victoria on 11/25/22.
//

import UIKit

class AutoExpTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var autoExpenseLabel: UILabel!
    
    @IBOutlet weak var autoAmountLabel: UILabel!
    
    
    @IBOutlet weak var autoDateLabel: UILabel!
    
    
    @IBOutlet weak var autoNotesLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
