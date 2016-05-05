//
//  ItemCreationViewController.swift
//  NavigationBar
//
//  Created by Guillermo Gruschka on 5/5/16.
//  Copyright © 2016 Gruvi. All rights reserved.
//

import UIKit

class ItemCreationViewController: UIViewController {


    @IBOutlet weak var itemCreationTextField: UITextField!
    @IBAction func createItem(sender: AnyObject) {
        dataSet.append(itemCreationTextField.text!)
        
        itemCreationTextField.text = ""
        
        NSUserDefaults.standardUserDefaults().setObject(dataSet, forKey: "dataSet")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        itemCreationTextField.resignFirstResponder()
    }
    
    

}
