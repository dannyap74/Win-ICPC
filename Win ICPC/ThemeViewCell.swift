//
//  ThemeViewController.swift
//  Win ICPC
//
//  Created by Даниил Палеев on 03/07/2019.
//  Copyright © 2019 Даниил Палеев. All rights reserved.
//

import UIKit
class ThemeTableViewCell: UITableViewCell{
    
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var themeProg: UIProgressView!
    @IBOutlet weak var clLabel: UILabel!
    @IBOutlet weak var perLabel: UILabel!
    
    var didTransform = false
    
    /*func progress() {
            if !didTransform {
                themeProg.transform = themeProg.transform.scaledBy(x: 1, y: 5)
                didTransform = true
            }
        
    }*/
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
    func initWith(item: Theme){
        themeLabel.text = item.name
        //themeProg.setProgress(Float(1), animated: false)
        clLabel.text = "Уроков: \(item.subthemes.count)"
        //print(item.level().0,item.level().1)
        //perLabel.text = "\(Int((item.level().0/item.level().1)*100)) %"
        //progress()
    }
    
}
