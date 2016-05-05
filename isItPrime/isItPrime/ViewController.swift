//
//  ViewController.swift
//  isItPrime
//
//  Created by Guillermo Gruschka on 5/4/16.
//  Copyright © 2016 Gruvi. All rights reserved.
//

import UIKit

private extension Int {
    
    func isPrime() -> Bool {
        switch self {
        case 0, 1, 2:
            return true
        default:
            for index in 2...self {
                if self % index == 0 && index != self {
                    return false
                }
            }
            return true
        }
    }
    
}

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var inputField: UITextField!
    @IBAction func checkPrime(sender: AnyObject) {
        guard let text = inputField.text, number = Int(text) else { return } //  si text era .None, sale de la función.
        
        resultLabel.text = number.isPrime() ? "Yes" : "No"
        
//        // y si text tenía algún valor, pero el resultado de Int(text) fue .None, también sale (es decir, no pudo convertir
//        // text a un Int)
//        
////no debería togglearse al tocar el textfield?
//        // cuando tocás el UITextField, este se convierte en firstResponder. Eso significa que se levanta el teclado y el input se lo redirige al firstResponder (el textField). Esto es así hasta que el UITextField deje de serlo. Vos lo tenés que codear
//        // por ejemplo podés hacer que cuando tocás en la vista de fondo, el UITextField resigne ser el firstResponder
//        var isPrime = true;
//        
//        if number != 1 && number != 2 {
//            for index in 2...number {
//                if number % index == 0 && index != number {
//                    isPrime = false
//                }
//            }
//        }
//
//        
//        if isPrime{
//            resultLabel.text = "Yes"
//        }else{
//            resultLabel.text = "No"
//        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        inputField.resignFirstResponder()
    }


}

