//
//  MainVC.swift
//  TRYCurrency
//
//  Created by Admin on 5.03.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var rateTable: RoundedTableView!
    
    let base = "TRY"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CurrencyService.shared.getExchangeRates(base: "TRY") { (rates) in
            rates.forEach({ (rate) in
                print(rate.desc)
            })
        }
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = rateTable.dequeueReusableCell(withIdentifier: "rateCell") as! RateCell
        
        return cell
    }
}
