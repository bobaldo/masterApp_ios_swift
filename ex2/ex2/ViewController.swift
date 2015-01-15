//
//  ViewController.swift
//  ex2
//
//  Created by Davide Patrizi on 15/01/15.
//  Copyright (c) 2015 Davide Patrizi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var btn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnInvia(sender: UIButton) {
        lbl.text = "nuovo testo";
    }

}

