//
//  CalenderView.swift
//  NC3
//
//  Created by Lazuardhi Imani Ahfar on 11/07/24.
//

import SwiftUI

struct CalenderView: View {
    
    @State private var selectedDate: String = ""
    @State private var selectedDay: String = ""

    @ObservedObject var calendarViewModel = CalendarViewModel()

    var body: some View {
        VStack {
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 20){
                    ForEach(calendarViewModel.nextSevenDays) { customDate in
                                    CalendarPicker(customDate: customDate, selectedDate: $selectedDate, selectedDay: $selectedDay)
                        .onTapGesture {
                            selectedDate = customDate.date
                            selectedDay = customDate.day
                        }
                    }
                }
                .padding()
            }
            .onAppear {
                        if let firstDate = calendarViewModel.nextSevenDays.first {
                            selectedDate = firstDate.date
                            selectedDay = firstDate.day
                        }
                    }
            
            
            Text("\(selectedDay), \(selectedDate)")
            
            
            List(calendarViewModel.nextSevenDays, id: \.date) { date in
                            VStack(alignment: .leading) {
                                Text(date.day)
                                    .font(.headline)
                                Text(date.date)
                                Text(date.time)
                            }
                        }

            
            
            
            Spacer()

        }
    }
}

#Preview {
    CalenderView()
}


