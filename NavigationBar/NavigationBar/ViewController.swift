//
//  ViewController.swift
//  NavigationBar
//
//  Created by Guillermo Gruschka on 5/4/16.
//  Copyright © 2016 Gruvi. All rights reserved.
//

import UIKit

var dataSet = [String]()

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var timer = NSTimer()
    var time = 0

    @IBOutlet weak var itemList: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSet.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = dataSet[indexPath.row]
        
        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
        itemList.reloadData()
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            dataSet.removeAtIndex(indexPath.row)
            
            itemList.reloadData()
            
            NSUserDefaults.standardUserDefaults().setObject(dataSet, forKey: "dataSet")

        }
    }
   
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
        
        if NSUserDefaults.standardUserDefaults().objectForKey("dataSet") != nil {
            dataSet = NSUserDefaults.standardUserDefaults().objectForKey("dataSet")! as! [String]
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

