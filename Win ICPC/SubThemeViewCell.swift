//
//  SubThemeViewCell.swift
//  Win ICPC
//
//  Created by Даниил Палеев on 03/07/2019.
//  Copyright © 2019 Даниил Палеев. All rights reserved.
//

import UIKit

class SubthemeTableViewCell: UITableViewCell{
    @IBOutlet weak var subthemeLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func initWith(item: Subtheme){
        subthemeLabel.text = item.name
        subthemeLabel.numberOfLines = 0
        var color = UIColor.white
        if item.solved {
            color = UIColor.green
        }
        backgroundColor = color
        
    }
    
}
