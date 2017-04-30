//
//  Alarm.swift
//  Alarm Clock
//
//  Created by Rosa Choe on 4/6/17.
//  Copyright © 2017 Rosa Choe. All rights reserved.
//

import Foundation
import UIKit
class Alarm {
    var alarmDate: Date?
    var active = false
    var name: String?
    
    init(newName: String, date: Date) {
        active = true
        alarmDate = date
        name = newName
    }
    
    func ring() -> Bool {
        let calendar = Calendar.current
        if (active && calendar.component(.hour, from: Date()) == calendar.component(.hour, from: alarmDate!) &&
            calendar.component(.minute, from: Date()) == calendar.component(.minute, from: alarmDate!)) {
            return true
        }
        return false
    }
    
    func toString() -> [String] {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from:alarmDate!)
        let minute = calendar.component(.minute, from:alarmDate!)
        
        var ampm = "AM"
        var strHour = ""
        var strMin = ""

        if hour > 12 {
            strHour = "\(hour - 12)"
            ampm = "PM"
            
        } else {
            strHour = "\(hour)"
        }
        
        if minute < 10 {
            strMin = "0\(minute)"
        } else {
            strMin = "\(minute)"
        }
        return ["\(strHour):\(strMin)",ampm]
    }
}
