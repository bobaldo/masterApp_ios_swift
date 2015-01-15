//
//  ViewController.swift
//  graphs
//
//  Created by Davide Patrizi on 23/12/14.
//  Copyright (c) 2014 Davide Patrizi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let csvURL = NSURL(string: "/Users/davidepatrizi/Documents/project/masterApp_ios_swift/graphs/CSVExample.csv")
        var error: NSErrorPointer = nil
        let csv = CSV(contentsOfURL: csvURL!, error: error)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

