//
//  ViewController.swift
//  ExitAppWithTimeInput
//
//  Created by Raghu on 29/7/16.
//  Copyright © 2016 Dummy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var timeRemaining: UILabel!
    
    var timeToQuite:Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func submitButtonClicked(sender: AnyObject) {
        
        self.view.endEditing(true)
        
        let string = NSString(string: self.inputTextField.text!)
        
        print("time inertval = %f",string.doubleValue)
        
        self.timeToQuite = string.doubleValue * 60.0
        
        NSTimer.scheduledTimerWithTimeInterval(string.doubleValue * 60.0, target: self, selector: #selector(ViewController.doExit), userInfo: nil, repeats: false)

        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.timeRemainsToQuit), userInfo: nil, repeats: true)
    }
    
    
    func doExit()
    {
        //home button press programmatically
        let app = UIApplication.sharedApplication()
        app.performSelector(#selector(NSURLSessionTask.suspend))
        
        //wait 2 seconds while app is going background
        NSThread.sleepForTimeInterval(2.0)
        
        //exit app when app is in background
        exit(0);
        
    }
    
    func timeRemainsToQuit()
    {
       self.timeToQuite = self.timeToQuite - 1.0
        
        timeRemaining.text = String(self.timeToQuite) + " " + "Seconds"
    }
    
}

