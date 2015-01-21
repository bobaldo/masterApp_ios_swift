//
//  StoricoController.swift
//  calc
//
//  Created by Davide Patrizi on 17/01/15.
//  Copyright (c) 2015 Davide Patrizi. All rights reserved.
//

import UIKit;

class StoricoController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var listStorico: UITableView!
    var history : [Storico] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listStorico.delegate = self;
        self.listStorico.dataSource = self;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let simpleTableIdentifier = "use";
        
        var cell = tableView.dequeueReusableCellWithIdentifier(simpleTableIdentifier) as? UITableViewCell
        if cell == nil {
           cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: simpleTableIdentifier)
        }
        
        cell!.textLabel!.text = String(self.history[indexPath.row].primoNumero) + " " + self.history[indexPath.row].operazione + " " + String(self.history[indexPath.row].secondoNumero)
        return cell!;
    }
}