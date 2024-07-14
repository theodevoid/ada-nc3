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
    @State var isNoon: Bool = false
    @State var selectedTime: String = "Morning"

    @ObservedObject var calendarViewModel = CalendarViewModel()

    var body: some View {
        NavigationStack {
            VStack{
                Spacer()
                
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
                .background(RadialGradient(gradient: Gradient(colors: [Color(red: 0.91, green: 0.79, blue: 0.5), Color(red: 0.81, green: 0.55, blue: 0.32)]), center: .center, startRadius: 5, endRadius: 450))
                .onAppear {
                            if let firstDate = calendarViewModel.nextSevenDays.first {
                                selectedDate = firstDate.date
                                selectedDay = firstDate.day
                            }
                        }
                
                
                
                SelectedDateDetail(selectedDay: $selectedDay, selectedDate: $selectedDate)
                
                
                VStack{
                    HStack{
                        Text("Activities For You")
                            .font(.headline)
                            .fontWeight(.heavy)
                        
                        Spacer()
                        VStack {
                            ToggleButton(selectedTime: $selectedTime)
                        }
                        .pickerStyle(.segmented)
                        .frame(width: 160)

                        
                    }
                    .padding()
                    
                    ScrollView{
                        VStack{
                            ForEach(1..<5, id: \.self) { index in
                                                CalendarRecCard()
                                            }
                        }
                    }
                    
                    Spacer()
                    
                }
                .background(RoundedRectangle(cornerRadius: 25.0)
                    .fill(.white))

                
                
                

            }
            .background(LinearGradient(colors: [Color(red: 0.91, green: 0.79, blue: 0.5), Color(red: 0.81, green: 0.55, blue: 0.32)], startPoint: .topLeading, endPoint: .bottomTrailing))
            
        }
        .navigationTitle("Schedule")
    }
}




#Preview {
    NavigationView{
        CalenderView()
    }
}









