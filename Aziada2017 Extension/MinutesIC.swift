//
//  MinutesIC.swift
//  Ashgabat 2017
//
//  Created by Atakishiyev Orazdurdy on 9/10/15.
//  Copyright (c) 2015 Asman Oky. All rights reserved.
//

import WatchKit
import Foundation
import Ashgabat2017WatchKit

class MinutesIC: WKInterfaceController {
    
    @IBOutlet weak var minutes: WKInterfaceLabel!
    
    var getCountDown:GetCountDown!
    private (set)var myTimer : NSTimer?
    private (set)var duration : NSTimeInterval = 60.0
    
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
        minutes.setText(String(format: "%02d", getCountDown.GetMinute()))
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