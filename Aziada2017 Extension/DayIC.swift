//
//  DayIC.swift
//  Ashgabat 2017
//
//  Created by Atakishiyev Orazdurdy on 9/10/15.
//  Copyright (c) 2015 Asman Oky. All rights reserved.
//

import WatchKit
import Foundation
import Ashgabat2017WatchKit

class DayIC: WKInterfaceController {
 
    @IBOutlet weak var days: WKInterfaceLabel!
    var getCountDown:GetCountDown!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
    }
    
    override func willActivate() {
        super.willActivate()
        getCountDown = GetCountDown()
        days.setText("\(getCountDown.GetDays())")

    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
}