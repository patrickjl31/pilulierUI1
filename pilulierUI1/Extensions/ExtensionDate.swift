//
//  ExtensionDate.swift
//  pilulierUI1
//
//  Created by patrick lanneau on 01/09/2020.
//  Copyright © 2020 patrick lanneau. All rights reserved.
//

import Foundation

// dates

extension Date {
    func localString(dateStyle: DateFormatter.Style = .medium,
      timeStyle: DateFormatter.Style = .medium) -> String {
        return DateFormatter.localizedString(
          from: self,
          dateStyle: dateStyle,
          timeStyle: timeStyle)
    }

    var midnight:Date{
        let cal = Calendar(identifier: .gregorian)
        return cal.startOfDay(for: self)
    }
    
    var demain: Date {
        let today = Date()
        let cal = Calendar.current
        return cal.date(byAdding: .day, value: 1, to: today)!
    }
    func  lendemain(jour: Date) -> Date {
        let cal = Calendar.current
        return cal.date(byAdding: .day, value: 1, to: jour)!
    }
    func  leLendemain() -> Date {
        let cal = Calendar.current
        return cal.date(byAdding: .day, value: 1, to: self)!
    }
    
    func dateToDouble(date:Date) -> Double {
        return date.timeIntervalSince1970
    }
    func  doubleToDate(val:Double) -> Date {
        let timeInterval = TimeInterval(val)
        return Date(timeIntervalSince1970: timeInterval)
    }
}
