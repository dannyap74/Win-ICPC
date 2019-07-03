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
        var color: UIColor
        switch item.stateOfTheme {
        case -1:
            color = UIColor.red
        case 0:
            color = UIColor.yellow
        case 1:
            color = UIColor.green
        default:
            color = UIColor.white
        }
        backgroundColor = color
        
    }
    
}
