//
//  Date.swift
//  NC3
//
//  Created by Lazuardhi Imani Ahfar on 11/07/24.
//

import Foundation

class CustomDate: Identifiable{
    var id = UUID()
    var date: String
    var day: String
    var time: String
    
    init(date: String, day: String, time: String) {
        self.date = date
        self.day = day
        self.time = time
    }
}


