//
//  UserInfoCell.swift
//  Doctor4All
//
//  Created by Kyle Gorter on 3/9/17.
//  Copyright © 2017 NextAcademy. All rights reserved.
//

import UIKit
import Eureka
import ImageRow
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

public protocol PresenterRowType: TypedRowType {
    associatedtype ProviderType : UIViewController, TypedRowControllerType
    var presentationMode: PresentationMode<ProviderType>? { get set }
    var onPresentCallback: ((FormViewController, ProviderType)->())? { get set }
    
    
}



final class UserInfoCell: Cell<StructUser>, CellType {
    
    
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var selectedDisplayImage: UIImageView!
    
    
    
    
    
    override func setup() {
        super.setup()
        
        selectionStyle = .none
        
        userImageView.contentMode = .scaleAspectFill
        
        userImageView.clipsToBounds = true
        
        nameLabel.font = .systemFont(ofSize: 18)
        
        emailLabel.font = .systemFont(ofSize: 13.3)
        
        dateLabel.font = .systemFont(ofSize: 13.3)
        
        for label in [emailLabel, nameLabel] {
            label?.textColor = UIColor.gray
        }
        
        height = {return 94}
        
        backgroundColor = UIColor(displayP3Red: 0.984, green: 0.988, blue: 0.976, alpha: 1.00)
    }
    
    override func update() {
        super.update()
        
        textLabel?.text = nil
        
        guard let user = row.value else {return}
        
        if let url = user.pictureURL, let data = NSData(contentsOf: url as URL) {
            userImageView.image = UIImage(named: "placeholder")
            
        }
        emailLabel.text = user.email
        
        nameLabel.text = user.name
        
        dateLabel.text = DateFormatter().string(from: user.dateOfBirth as Date)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    required init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}











