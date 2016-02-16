//
//  HoursIC.swift
//  Ashgabat 2017
//
//  Created by Atakishiyev Orazdurdy on 9/10/15.
//  Copyright (c) 2015 Asman Oky. All rights reserved.
//

import WatchKit
import Foundation
import Ashgabat2017WatchKit

class HoursIC: WKInterfaceController {
    
    @IBOutlet weak var hours: WKInterfaceLabel!
    var getCountDown:GetCountDown!
    private (set)var myTimer : NSTimer?
    private (set)var duration : NSTimeInterval = 3600.0
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
    }
    
    override func willActivate() {
        super.willActivate()
        timerDone()
    }
    
    func timerDone() {
        timerReset()
        getCountDown = GetCountDown()
        hours.setText(String(format: "%02d", getCountDown.GetHours()))
    }
    
    func timerReset(){
        
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Hour, .Minute, .Second], fromDate: date)
        let second = NSTimeInterval(components.minute)
  
        myTimer = NSTimer.scheduledTimerWithTimeInterval(duration - second * 60,
            target: self,
            selector: "timerDone",
            userInfo: nil,
            repeats: true)
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
}