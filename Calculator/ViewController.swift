//
//  ViewController.swift
//  Calculator
//
//  Created by Kajal Choudhary on 03/04/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var currentNum : Double = 0
    var prevNum : Double = 0
    var performingMath = false
    var operation = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultLabel.text = "0"
        
        
    }
    
    @IBAction func numbers(_ sender: UIButton){
        if performingMath == true{
            resultLabel.text = String(sender.tag-1)
            currentNum = Double(resultLabel.text!)!
            performingMath = false
        }else{
            resultLabel.text = resultLabel.text! + String(sender.tag-1)
            currentNum = Double(resultLabel.text!)!
        }
    }
    
    @IBAction func buttons(_ sender: UIButton){
        if resultLabel.text != "" && sender.tag != 11 && sender.tag != 16{
            prevNum = Double(resultLabel.text!)!
            if sender.tag == 12 { // Divide
                            resultLabel.text = "/"
                        } else if sender.tag == 13 { // Multiply
                            resultLabel.text = "*"
                        } else if sender.tag == 14 { // Subtract
                            resultLabel.text = "-"
                        } else if sender.tag == 15 { // Add
                            resultLabel.text = "+"
                        }

                        operation = sender.tag
                        performingMath = true
        }else if sender.tag == 16{
            if operation == 12 { // Divide
                           resultLabel.text = String(prevNum / currentNum)
                       } else if operation == 13 { // Multiply
                           resultLabel.text = String(prevNum * currentNum)
                       } else if operation == 14 { // Subtract
                           resultLabel.text = String(prevNum - currentNum)
                       } else if operation == 15 { // Add
                           resultLabel.text = String(prevNum + currentNum)
                       }
        }else if sender.tag == 11{
            resultLabel.text = "0"
                        prevNum = 0
                        currentNum = 0
                        operation = 0
        }
    }


}

