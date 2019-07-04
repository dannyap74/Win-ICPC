//
//  MaterialTableViewCell.swift
//  Win ICPC
//
//  Created by Даниил Палеев on 04/07/2019.
//  Copyright © 2019 Даниил Палеев. All rights reserved.
//

import UIKit

class MaterialTableViewCell: UITableViewCell {
    @IBOutlet weak var linkLabel: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func initWith(s: String){
        linkLabel.text = s
    }
    
}
