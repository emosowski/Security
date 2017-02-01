//
//  HousesCell.swift
//  Security App
//
//  Created by Osowski, Emily, Vodafone Americas on 1/31/17.
//  Copyright © 2017 emilyosowski. All rights reserved.
//

import UIKit

class HousesCell: UITableViewCell, UIScrollViewDelegate {
    
//    @IBOutlet var houseNameText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func bindData(alert: Alert) {
        
//        self.houseNameText.text = alert.AlertTitle! as String
//        print("data bound")
        
    }
}
