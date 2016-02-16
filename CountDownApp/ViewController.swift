//
//  ViewController.swift
//  CountDownApp
//
//  Created by Atakishiyev Orazdurdy on 2/16/16.
//  Copyright © 2016 orazz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countDown: UILabel!
    
    private (set)var counterType = 1
    private (set)var timer: NSTimer!
    private (set)var gameStartDate = "2017-09-15"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesturImage = UITapGestureRecognizer(target: self, action: Selector("onImageTap"))
        countDown.userInteractionEnabled = true
        countDown.addGestureRecognizer(tapGesturImage)
        startCountDown()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func onImageTap() {
        switch(counterType) {
        case 5:
            counterType = 0
        default: counterType++
            break
        }
        startCountDown()
    }

    func startCountDown() {
        
        var duration = 0.0
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let endDate:NSDate = dateFormatter.dateFromString(gameStartDate)!
        
        var endDateTimeInterval = endDate.timeIntervalSinceNow
        if endDateTimeInterval < 0 {
            endDateTimeInterval = 0
        }
        
        switch (counterType) {
        case 0:
            duration = 1
            if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone {
                countDown.font = UIFont(name: "Helvetica Neue", size: 50)
                
            }else{
                countDown.font = UIFont(name: "Helvetica Neue", size: 90)
            }
            
        case 1:
            duration = 86400
            countDown.text = "\(Int(endDateTimeInterval/86400))"
            if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone {
                countDown.font = UIFont(name: "Helvetica Neue", size: 110.0)
            }else{
                countDown.font = UIFont(name: "Helvetica Neue", size: 220.0)
            }
        case 2:
            duration = 3600
            countDown.text = "\(Int(endDateTimeInterval/3600))"
            if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone {
                countDown.font = UIFont(name: "Helvetica Neue", size: 95.0)
            }else{
                countDown.font = UIFont(name: "Helvetica Neue", size: 200.0)
            }
        case 3:
            duration = 60
            countDown.text = "\(Int(endDateTimeInterval/60))"
            if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone {
                countDown.font = UIFont(name: "Helvetica Neue", size: 80.0)
            }else{
                countDown.font = UIFont(name: "Helvetica Neue", size: 140.0)
            }
        case 4:
            duration = 1
            countDown.text = "\(Int(endDateTimeInterval))"
            if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone {
                countDown.font = UIFont(name: "Helvetica Neue", size: 70)
            }else{
                countDown.font = UIFont(name: "Helvetica Neue", size: 120)
            }
        case 5:
            duration = 0.1
            countDown.text = "\(Int64(endDateTimeInterval * 1000))"
            if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone {
                countDown.font = UIFont(name: "Helvetica Neue", size: 50)
            }else{
                countDown.font = UIFont(name: "Helvetica Neue", size: 90)
            }
        default:break
        }
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(duration, target: self, selector: "updateTimer:", userInfo: endDate.timeIntervalSinceNow, repeats: true);
    }


    func updateTimer(timer:NSTimer) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let endDate = dateFormatter.dateFromString(gameStartDate)!.timeIntervalSinceNow
        var counter = ""
        
        switch(counterType) {
        case 0:
            let days = Int(endDate / 86400)
            let hours =  (Int(endDate) - Int(days*86400)) / 3600
            let minutes = (Int(endDate) % 3600)/60
            let seconds =  (Int(endDate) % 3600)%60
            counter = "\(days):"+String(format: "%02d", hours)+":"+String(format: "%02d", minutes)+":"+String(format: "%02d", seconds)
        case 1:
            counter = "\(Int(endDate/86400))"
        case 2:
            counter = "\(Int(endDate)/3600)"
        case 3:
            counter = "\(Int(endDate)/60)"
        case 4:
            counter = "\(Int(endDate))"
        case 5:
            counter = "\(Int64(endDate*1000))"
        default:break
        }
        
        if endDate < 0 {
            counter = "0"
        }
        
        countDown.text = counter
    }
}

