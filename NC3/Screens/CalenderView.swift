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
                .background(LinearGradient(
                    stops: [
                    Gradient.Stop(color: Color(red: 0.81, green: 0.56, blue: 0.32).opacity(0.5), location: 0.00),
                    Gradient.Stop(color: Color(red: 0.81, green: 0.56, blue: 0.32).opacity(0), location: 0.47),
                    Gradient.Stop(color: Color(red: 0.81, green: 0.56, blue: 0.32).opacity(0.5), location: 1.00),
                    ],
                    startPoint: UnitPoint(x: 0, y: 0.5),
                    endPoint: UnitPoint(x: 1, y: 0.5)
                    ))
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
                    .fill(.accent))

                
                
                

            }
            .background(Image("backgroundDarkLight").ignoresSafeArea())
            
        }
        .navigationTitle("Schedule")
    }
}




#Preview {
    NavigationView{
        CalenderView()
    }
}









