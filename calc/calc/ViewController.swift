//
//  ViewController.swift
//  calc
//
//  Created by Davide Patrizi on 15/01/15.
//  Copyright (c) 2015 Davide Patrizi. All rights reserved.
//

import UIKit;

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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func initializer(){
        pNumero = ""
        sNumero = ""
        hasNumber = false
        hasOperation = false
        op = ""
        txtOperazioni.text = ""
        txtRisultato.text = "0"
    }
    
    func append(add: String, isOperation: Bool){
        if(isOperation){
            if(pNumero.isEmpty){
                if(txtRisultato.text!.toInt() == 0){
                    return
                }else{
                    pNumero = txtRisultato.text!
                    hasNumber = true
                    hasOperation = true
                    txtOperazioni.text = txtRisultato.text
                    op = add
                }
            }else if(!hasOperation){
                hasOperation = true
                hasNumber = true
                op=add;
            }else if(hasOperation && !pNumero.isEmpty && !sNumero.isEmpty){
                calcola()
                txtOperazioni.text = txtRisultato.text
                pNumero = txtRisultato.text!
                hasOperation = true
                hasNumber = true
                op = add
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
    
    func calcola(){
        var p = pNumero.toInt()
        var s = sNumero.toInt()
        
        switch(self.op){
        case "+":
            self.txtRisultato.text = String(p! + s!)
        case "*":
            self.txtRisultato.text = String(p! * s!)
        case "/":
            self.txtRisultato.text = String(p! / s!)
        case "-":
            self.txtRisultato.text = String(p! - s!)
        default:
            self.txtRisultato.text = "0"
        }
        
        //TODO: introdurre lo storico
        txtOperazioni.text = ""
        pNumero = ""
        sNumero = ""
        hasNumber = false
        hasOperation = false

    }
    
    @IBAction func btnUguale(sender: AnyObject) {
        if(!pNumero.isEmpty && !sNumero.isEmpty){
            calcola()
        }
    }
    
    @IBAction func btnPiu(sender: AnyObject) {
        append("+", isOperation: true);
    }
    @IBAction func btnMeno(sender: AnyObject) {
        append("-", isOperation: true);
    }
    @IBAction func btnDiv(sender: AnyObject) {
        append("/", isOperation: true);
    }
    @IBAction func btnMol(sender: AnyObject) {
        append("*", isOperation: true);
    }
    @IBAction func btn0(sender: AnyObject) {
        append("0", isOperation: false);
    }
    @IBAction func btn1(sender: AnyObject) {
        append("1", isOperation: false);
    }
    @IBAction func btn2(sender: AnyObject) {
        append("2", isOperation: false);
    }
    @IBAction func btn3(sender: AnyObject) {
        append("3", isOperation: false);
    }
    @IBAction func btn4(sender: AnyObject) {
        append("4", isOperation: false);
    }
    @IBAction func btn5(sender: AnyObject) {
        append("5", isOperation: false);
    }
    @IBAction func btn6(sender: AnyObject) {
        append("6", isOperation: false);
    }
    @IBAction func btn7(sender: AnyObject) {
        append("7", isOperation: false);
    }
    @IBAction func btn8(sender: AnyObject) {
        append("8", isOperation: false);
    }
    @IBAction func btn9(sender: AnyObject) {
        append("9", isOperation: false);
    }
    @IBAction func btnReset(sender: AnyObject) {
        initializer();
    }
}