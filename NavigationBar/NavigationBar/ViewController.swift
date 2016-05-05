//
//  ViewController.swift
//  NavigationBar
//
//  Created by Guillermo Gruschka on 5/4/16.
//  Copyright © 2016 Gruvi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer = NSTimer()
    var time = 0

   
    @IBOutlet weak var timerLabel: UILabel!

    func incrementTimer(){
        timerLabel.text = "AppTimer: \(time)"
        time+=1
    }
    
    @IBAction func playTimer(sender: AnyObject) {
       timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.incrementTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseTimer(sender: AnyObject) {
        timer.invalidate()
    }
    
    @IBAction func resetTimer(sender: AnyObject) {
        timer.invalidate()
        time = 0
        timerLabel.text = "AppTimer: \(time)"
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

