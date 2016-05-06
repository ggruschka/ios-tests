//
//  WeatherViewController.swift
//  NavigationBar
//
//  Created by Guillermo Gruschka on 5/5/16.
//  Copyright © 2016 Gruvi. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var weatherSummary: UILabel!
    @IBOutlet weak var cityInput: UITextField!
    @IBAction func checkWeather(sender: AnyObject) {
        if cityInput.text != ""{
            
            let tokenizedURL = "http://www.weather-forecast.com/locations/%TOKEN%/forecasts/latest".stringByReplacingOccurrencesOfString("%TOKEN%", withString: cityInput.text!)
            
            let url = NSURL(string: tokenizedURL)
            
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) -> Void in
                
                if let rawContent = data {
                    let encodedContent = NSString(data: rawContent, encoding: NSUTF8StringEncoding)
                    let beginningSeparator = "3 Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">"
                    let endingSeparator = "</span>"
                    
                    if encodedContent!.containsString(beginningSeparator){
                        let weatherSummary = encodedContent?.componentsSeparatedByString(beginningSeparator)[1].componentsSeparatedByString(endingSeparator)[0].stringByReplacingOccurrencesOfString("&deg;", withString: "°")
                        
                        dispatch_async(dispatch_get_main_queue(), {
                            self.weatherSummary.text = weatherSummary!
                        })
                        
                        
                    }
                    
                    
                }
            }
            task.resume()
        }
        

        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
