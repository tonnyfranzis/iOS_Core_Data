//
//  TNDataTableViewCell.swift
//  TNCoreDataCellView
//
//  Created by Prasobh Veluthakkal on 16/02/17.
//  Copyright © 2017 Focaloid. All rights reserved.
//

import UIKit

class TNDataTableViewCell: UITableViewCell {

    
    @IBOutlet weak var bloodLabel: UILabel!
    
    
    @IBOutlet weak var ageLabel: UILabel!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
   
    
    @IBOutlet weak var image1: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
