//
//  RoundedTableView.swift
//  TRYCurrency
//
//  Created by Admin on 6.03.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import UIKit

class RoundedTableView: UITableView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing codes
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.masksToBounds = true
        layer.cornerRadius = 10.0
    }

}
