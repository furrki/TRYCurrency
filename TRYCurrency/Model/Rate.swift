//
//  Rate.swift
//  TRYCurrency
//
//  Created by Admin on 6.03.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import Foundation

class Rate {
    var base: String
    var to: String
    var value: Double
    
    var desc: String {
        return "\(base) \(to) \(value)"
    }
    
    var inverseValue: Double {
        return 1 / value
    }
    
    init(base: String, to: String, value: Double) {
        self.base = base
        self.to = to
        self.value = value
    }
}
