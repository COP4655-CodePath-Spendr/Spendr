//
//  MiscExpTableViewCell.swift
//  Spendr
//
//  Created by Gina Victoria on 11/25/22.
//

import UIKit

class MiscExpTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var MiscExpenseLabel: UILabel!
    
    @IBOutlet weak var MiscAmountLabel: UILabel!
    
    @IBOutlet weak var MiscDateLabel: UILabel!
    
    
    @IBOutlet weak var MiscNotesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
