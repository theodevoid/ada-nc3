//
//  Date.swift
//  NC3
//
//  Created by Lazuardhi Imani Ahfar on 11/07/24.
//

import Foundation

class CustomDate: Identifiable{
    var id = UUID()
    var fullDate:Date
    var date: String
    var day: String
    var time: String
    
    init(fulldate:Date, date: String, day: String, time: String) {
        self.fullDate = fulldate
        self.date = date
        self.day = day
        self.time = time
    }
}


