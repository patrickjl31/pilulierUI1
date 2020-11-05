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
    
    // Renvoie une date en chaine ramenée à midi
    func stringAMidi() -> String {
        let formatter = DateFormatter()
        //formatter.dateStyle = .short
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.string(from: self) + " 12:00:00 Z"
    }
    
    //Renvoie le jour en n
    func jourEn( en: Int) -> Date {
        let unJour:TimeInterval = 3600 * 24
        return Date(timeInterval: TimeInterval(en) * unJour, since: self)
    }
    
    func enJoursPlusTard(combien:Int) -> Date {
        let cal = Calendar.current
        return cal.date(byAdding: .day, value: combien, to: self)!
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



// toDate renvoie une date
let FORMAT_DATE_LONGUE = "dd-MM-yyyy HH:mm:ss Z"
let FORMAT_DATE_COURTE = "dd-MM-yyyy"
extension String {
    func toDate()-> Date?{
        let dateFormatter = DateFormatter()
            //dateFormatter.timeZone = TimeZone(identifier: "Asia/Tehran")
            dateFormatter.locale = Locale(identifier: "fr-FR")
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = FORMAT_DATE_LONGUE
        if let date = dateFormatter.date(from: self) {
            return date
        } else {
            dateFormatter.dateFormat = FORMAT_DATE_COURTE
            if let date1 = dateFormatter.date(from: self) {
                return date1
            }
        }
        return nil
    }
}




