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
        self.primoNumero = pNumero
        self.secondoNumero = sNumero
        self.operazione = op
    }
    
    var primoNumero = ""
    var secondoNumero = ""
    var operazione = ""
}