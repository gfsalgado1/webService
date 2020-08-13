//
//  ViewController.swift
//  Giselle_S_weatherApp
//
//  Created by Giselle Salgado on 8/13/20.
//  Copyright © 2020 Giselle Salgado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //TODO: This is step 1
        //Tell my function where to look for the weather data
        //
        
        if let url = NSURL(string: "https://api.darksky.net/forecast/ae58c5fa7285b492f6a553d200018d9e/42.5917,88.4334"){
            if let data = NSData(contentsOf:url as URL){
                //TODO: This is step 2
                //Parse through the data
                //
                do {
                    let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments)
                        as! [String:AnyObject]
                    
                    //TODO: This is step 3
                    //Temporarily store the parsed data in a dictionary
                    //
                    
                    let newDict = parsed
                    
                    //TODO: This is step 4
                    // print out these 3 pieces of data in the terminal window to check them
                    //
                    
                    print(newDict["currently"]!["summary"] as Any)
                    print(newDict["currently"]!["temperature"] as Any)
                    print(newDict["currently"]!["Dewpoint"] as Any)
                    
                    self.currentTemp.text = "\(newDict["currently"]!["temperature"]!!)"
                    self.currentTemp.text = "\(newDict["currently"]!["summary"]!!)"
                    self.currentTemp.text = "\(newDict["currently"]!["dewPoint"]!!)"
                    
                    
                    
                    }
                    
                    catch let error as NSError{
                    print("A JSONerror occured :\n \(error)")
                }
            }
        }
        
        
        
        
        
    }

    
    @IBOutlet weak var currentTemp: UILabel!
    
    @IBOutlet weak var currentSummary: UILabel!
    
    @IBOutlet weak var currentDewpoint: UILabel!
}

