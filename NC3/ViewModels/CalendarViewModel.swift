//
//  DateViewModel.swift
//  NC3
//
//  Created by Lazuardhi Imani Ahfar on 11/07/24.
//

import Foundation
import Combine

class CalendarViewModel: ObservableObject {
    @Published var nextSevenDays: [CustomDate] = []
    
    private let dateService: DateService
    
    init(dateService: DateService = DateService()) {
        self.dateService = dateService
        self.updateDates()
    }
    
    private func updateDates() {
        self.nextSevenDays = dateService.getNextSevenDays()
    }
}

