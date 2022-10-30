//
//  Clock.swift
//  Clock
//
//  Created by Robert Huber on 10/30/22.
//

import Foundation
class Clock {
    static var currentTime: (() -> String) = {
        let today = Date()
        
        let hours = (Calendar.current.component(.hour, from: today))
        let minutes = (Calendar.current.component(.minute, from: today))
        let minuteString = String(format: "%02d", minutes)
        let seconds = (Calendar.current.component(.second, from: today))
        let secondString = String(format: "%02d", seconds)
        return "\(hours):\(minuteString):\(secondString)"
    }
}
