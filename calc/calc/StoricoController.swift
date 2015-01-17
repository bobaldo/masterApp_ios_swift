//
//  StoricoController.swift
//  calc
//
//  Created by Davide Patrizi on 17/01/15.
//  Copyright (c) 2015 Davide Patrizi. All rights reserved.
//

import UIKit;

class StoricoController: UIViewController {

    @IBOutlet weak var listStorico: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var data:NSMutableArray = ["a","b","c"]
        
      //  listStorico.load = data
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 0;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}
