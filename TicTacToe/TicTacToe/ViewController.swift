//
//  ViewController.swift
//  TicTacToe
//
//  Created by Guillermo Gruschka on 5/6/16.
//  Copyright © 2016 Guillermo Gruschka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var finnMovesLabel: UILabel!
    @IBOutlet weak var jakeMovesLabel: UILabel!
    
    var turn = 0
    let winnerPlays = [[1,2,3],[4,5,6],[7,8,9],[1,5,9],[3,5,7]]
    var firstPlayerPlays: [Int] = []
    var secondPlayerPlays: [Int] = []
    var plays: [Int] = []

    @IBAction func btnClick(sender: AnyObject) {
        if (!plays.contains(sender.tag)){
            switch turn {
            case 0:
                sender.setImage(UIImage(named: "finn.png"), forState: .Normal)
                turn += 1
                turnLabel.text = "Jake's turn"
                plays.append(sender.tag!)
                firstPlayerPlays.append(sender.tag!)
            case 1:
                sender.setImage(UIImage(named: "jake.png"), forState: .Normal)
                turn = 0
                turnLabel.text = "Finn's turn"
                plays.append(sender.tag!)
                secondPlayerPlays.append(sender.tag!)
            default:
                break
            }
        }
        
        finnMovesLabel.text = "Finn's moves: " + firstPlayerPlays.description
        jakeMovesLabel.text = "Jake's moves: " + secondPlayerPlays.description
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if turn == 0{
            turnLabel.text = "Finn's turn"
        } else{
            turnLabel.text = "Jake's turn"
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

