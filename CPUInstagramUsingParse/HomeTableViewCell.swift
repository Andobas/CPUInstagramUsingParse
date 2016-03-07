//
//  HomeTableViewCell.swift
//  CPUInstagramUsingParse
//
//  Created by Juan Hernandez on 3/5/16.
//  Copyright © 2016 ccsf. All rights reserved.
//

import UIKit
import ParseUI
import Parse


class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photoFromParse: PFImageView!
 
    @IBOutlet weak var captionUILabel: UILabel!
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
