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
    @IBOutlet weak var valTextField: UITextField!
    
    let base = "TRY"
    var multiplier = 1.0
    var rates = [Rate]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CurrencyService.shared.getExchangeRates(base: "TRY") { [unowned self] (rates) in
            DispatchQueue.main.async {
                self.rates = rates
                self.rateTable.reloadData()
            }
        }
        rateTable.delegate = self
        rateTable.dataSource = self
        rateTable.tableFooterView = UIView()
        rateTable.separatorStyle = .none
        rateTable.allowsSelection = false
        
        valTextField.addTarget(self, action: #selector(MainVC.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let _ = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= 180
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text, let val = Double(text) {
            multiplier = val
        } else {
            multiplier = 1
        }
        rateTable.reloadData()
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = rateTable.dequeueReusableCell(withIdentifier: "rateCell") as! RateCell
        cell.fillWith(rate: rates[indexPath.row], multiplier: multiplier)
        return cell
    }
}
