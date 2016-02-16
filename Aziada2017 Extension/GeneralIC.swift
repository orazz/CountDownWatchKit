//
//  GeneralIC.swift
//  Ashgabat 2017
//
//  Created by Atakishiyev Orazdurdy on 9/10/15.
//  Copyright (c) 2015 Asman Oky. All rights reserved.
//

import WatchKit
import Foundation
import Ashgabat2017WatchKit

class GeneralIC: WKInterfaceController {
    
    @IBOutlet weak var days: WKInterfaceLabel!
    @IBOutlet weak var hours: WKInterfaceLabel!
    @IBOutlet weak var minutesLB: WKInterfaceLabel!
    @IBOutlet var seconds: WKInterfaceLabel!

    private (set)var myTimer : NSTimer?
    private (set)var timer: NSTimer?
    private (set)var countdown : Int! = 0
    private (set)var duration : NSTimeInterval = 60.0
    private (set)var getCountDown: GetCountDown!
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
        seconds.setText(String(format: "%02d", 60 - Int(timeString)!))
    }
    
    func timerDone() {
        getCountDown = GetCountDown()
        days.setText(String(format: "%02d", getCountDown.GetDays()))
        hours.setText(String(format: "%02d", getCountDown.GetHours()))
        minutesLB.setText(String(format: "%02d", getCountDown.GetMinute()))
        
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
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}