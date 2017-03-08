//
//  MenuCell.swift
//  Doctor4All
//
//  Created by Othman Mashaab on 03/03/2017.
//  Copyright © 2017 NextAcademy. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
  
    @IBOutlet weak var menuIcon: UIImageView!
    @IBOutlet weak var menuLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
