//
//  TableViewCell2.swift
//  
//
//  Created by Othman Mashaab on 08/03/2017.
//
//

import UIKit

class TableViewCell2: UITableViewCell {

  
    @IBOutlet weak var patientLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var condLabel: UILabel!
    @IBOutlet weak var addLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
