//
//  ViewController.swift
//  calc
//
//  Created by Davide Patrizi on 15/01/15.
//  Copyright (c) 2015 Davide Patrizi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var pNumero = ""
    var sNumero = ""
    var hasNumber = false
    var hasOperation = false
    var op = ""
    
    @IBOutlet weak var txtRisultato: UILabel!
    @IBOutlet weak var txtOperazioni: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func append(add: String, isOperation: Bool){
        if(isOperation){
            if(pNumero.isEmpty){
                if(txtRisultato.text!.toInt() == 0)
                {
                    return
                }else{
                    pNumero = txtRisultato.text!
                    hasNumber = true
                    hasOperation = true
                    txtOperazioni.text = txtRisultato.text
                }
            }else if(!hasOperation){
                hasOperation = true
                hasNumber = true
                op=add;
            }else{
                return
            }
        }else{
            if(hasNumber){
                sNumero += add;
            }else{
                pNumero += add;
            }
        }
        txtOperazioni.text = txtOperazioni.text! + add;
    }
    
    @IBAction func btnUguale(sender: AnyObject) {
        if(!pNumero.isEmpty && !sNumero.isEmpty)
        {
            var p = pNumero.toInt()
            var s = sNumero.toInt()
            
            switch(op){
            case "+":
                txtRisultato.text = String(p!+s!)
            default:
                txtRisultato.text = "0"
            }
            //TODO: introdurre lo storico
            txtOperazioni.text = ""
            pNumero = ""
            sNumero = ""
            hasNumber = false
            hasOperation = false
        }
    }
    
    @IBAction func btnPiu(sender: AnyObject) {
        append("+", isOperation: true);
    }
    
    @IBAction func btn1(sender: AnyObject) {
        append("1", isOperation: false);
    }
}