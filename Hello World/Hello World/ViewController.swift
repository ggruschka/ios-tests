//
//  ViewController.swift
//  Hello World
//
//  Created by Guillermo Gruschka on 5/3/16.
//  Copyright © 2016 Gruvi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func submit(sender: AnyObject) {
        var variable = Int(textField.text!)!
        
        variable = variable * 2
        
        label.text = "\(variable)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

x