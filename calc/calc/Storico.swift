//
//  Storico.swift
//  calc
//
//  Created by Davide Patrizi on 20/01/15.
//  Copyright (c) 2015 Davide Patrizi. All rights reserved.
//

import Foundation

class Storico{
    init(pNumero: String, sNumero: String, op: String) {
        self.primoNumero = pNumero.toInt()!
        self.secondoNumero = sNumero.toInt()!
        self.operazione = op
    }
    
    var primoNumero = 0
    var secondoNumero = 0
    var operazione = ""
}