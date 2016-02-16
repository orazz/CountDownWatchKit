//
//  File.swift
//  Ashgabat 2017
//
//  Created by Atakishiyev Orazdurdy on 9/10/15.
//  Copyright (c) 2015 Asman Oky. All rights reserved.
//

import Foundation
import UIKit

public class GetCountDown {
    
    let date = NSDate()
    let calendar = NSCalendar.currentCalendar()
    
    var daysLeft: Int!
    var hoursLeft: Int!
    var minutesLeft: Int!

    public init() {
        let components = calendar.components([.Hour, .Minute, .Month, .Year, .Day], fromDate: date)
        let currentDate = calendar.dateFromComponents(components)
        // here we set the due date. When the timer is supposed to finish
        let userCalendar = NSCalendar.currentCalendar()
        let competitionDate = NSDateComponents()
        competitionDate.year = 2017
        competitionDate.month = 9
        competitionDate.day = 15
        competitionDate.hour = 00
        competitionDate.minute = 00
        let competitionDay = userCalendar.dateFromComponents(competitionDate)!
        
        // Here we compare the two dates
        competitionDay.timeIntervalSinceDate(currentDate!)
        
        let dayCalendarUnit: NSCalendarUnit = ([.Day, .Hour, .Minute])
        
        //here we change the seconds to hours,minutes and days
        let CompetitionDayDifference = userCalendar.components(
            dayCalendarUnit, fromDate: currentDate!, toDate: competitionDay,
            options: [])
        //finally, here we set the variable to our remaining time
        self.daysLeft = CompetitionDayDifference.day
        self.hoursLeft = CompetitionDayDifference.hour
        self.minutesLeft = CompetitionDayDifference.minute
    }
    
    public func GetDays() -> Int {
        return daysLeft
    }
    
    public func GetHours() -> Int {
        return hoursLeft
    }
    
    public func GetMinute() -> Int {
        return minutesLeft
    }
    
}