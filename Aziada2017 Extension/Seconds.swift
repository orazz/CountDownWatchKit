//
//  Seconds.swift
//  Ashgabat 2017
//
//  Created by Atakishiyev Orazdurdy on 9/10/15.
//  Copyright (c) 2015 Asman Oky. All rights reserved.
//

import WatchKit
import Foundation
import Ashgabat2017WatchKit

class SecondsIC: WKInterfaceController {
    
    @IBOutlet var seconds: WKInterfaceLabel!
    
    private (set)var myTimer : NSTimer?
    private (set)var duration : NSTimeInterval = 60.0
    private (set)var timer: NSTimer?
    
    let getCountDown = GetCountDown()
    let timeFormatter = NSDateFormatter()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        timeFormatter.dateFormat = "ss"
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "tick:", userInfo: nil, repeats: true)
    }
    
    override func willActivate() {
        super.willActivate()
        timerDone()
    }
    
    func tick(timer: NSTimer) {
        let now = NSDate()
        let timeString = timeFormatter.stringFromDate(now)
        seconds.setText("\(60 - Int(timeString)!)")
    }
    
    func timerDone() {
        timerReset()
    }
    
    func timerReset(){
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Hour, .Minute, .Second], fromDate: date)
        let second = NSTimeInterval(components.second)
        
        myTimer = NSTimer.scheduledTimerWithTimeInterval(duration - second,
            target: self,
            selector: "timerDone",
            userInfo: nil,
            repeats: true)
    }

    override func didDeactivate() {
        super.didDeactivate()
    }
}