//
//  MainVC.swift
//  TRYCurrency
//
//  Created by Admin on 5.03.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        CurrencyService.shared.getExchangeRates(base: "TRY") { (rates) in
            rates.forEach({ (rate) in
                print(rate.desc)
            })
        }
    }
}
