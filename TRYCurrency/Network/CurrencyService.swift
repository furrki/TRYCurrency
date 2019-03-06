//
//  CurrencyService.swift
//  TRYCurrency
//
//  Created by Admin on 6.03.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import Foundation
import Alamofire

class CurrencyService {
    static var shared = CurrencyService()
    
    func getUrl(from base: String) -> String{
        //
        return "https://api.exchangeratesapi.io/latest?symbols=USD,EUR,GBP,CZK,CNY,JPY&base=\(base)"
    }
    
    func getExchangeRates(base: String, onFinish: @escaping (_ rates: [Rate]) -> Void){
    
            var rateArray = [Rate]()
            AF.request(getUrl(from: base)).responseJSON { (res) in
                guard let json = res.result.value as? Dictionary<String, Any> else {
                    onFinish([])
                    return
                }
                if let rates = json["rates"] as? Dictionary<String, Any> {
                    for (key, value) in rates {
                        if base != key {
                            let rate = Rate(base: base, to: key, value: value as! Double)
                            rateArray.append(rate)
                        }
                    }
                    onFinish(rateArray)
                }
            
        }
    }
    
}
