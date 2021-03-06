//
//  RateCell.swift
//  TRYCurrency
//
//  Created by Admin on 6.03.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import UIKit

class RateCell: UITableViewCell {

    @IBOutlet weak var baseLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillWith(rate: Rate, multiplier: Double) {
        baseLabel.text = "\(multiplier) \(rate.to)"
        toLabel.text = "\((rate.inverseValue * multiplier).limitDecimals()) \(rate.base)"
    }
}
