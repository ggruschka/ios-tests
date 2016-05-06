//
//  TicTacToeController.swift
//  NavigationBar
//
//  Created by Guillermo Gruschka on 5/6/16.
//  Copyright © 2016 Gruvi. All rights reserved.
//

import UIKit

class TicTacToeController: UIViewController {

    @IBOutlet weak var image11: UIImageView!
    @IBOutlet weak var image12: UIImageView!
    @IBOutlet weak var image13: UIImageView!
    @IBOutlet weak var image21: UIImageView!
    @IBOutlet weak var image22: UIImageView!
    @IBOutlet weak var image23: UIImageView!
    @IBOutlet weak var image31: UIImageView!
    @IBOutlet weak var image32: UIImageView!
    @IBOutlet weak var image33: UIImageView!
    
    var turn = 1
    
    @IBAction func squareClick(sender: AnyObject) {
        let tag = Int(sender.tag!)
        
        switch tag {
        case 1:
            if turn == 1{
                image11.image = UIImage(named: "finn.jpg")
                turn+=1
            }else{
                image11.image = UIImage(named: "jake.jpg")
                turn=1
            }
        default:
            break
        }
        
        print("btnclicked by \(tag)")
        
        
    }
}
