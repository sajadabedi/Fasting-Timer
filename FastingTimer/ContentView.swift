//
//  ContentView.swift
//  FastingTimer
//
//  Created by Sajad Abedi on 17.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var fastingManager = FastingManager()
    var title: String {
        switch fastingManager.fastingState {
        case .notStarted:
            return "Let's get started"
        case .fasting:
            return "You are now fasting"
        case .feeding:
            return "You are now feeding"
        }
    }
    
    var body: some View {
        ZStack {
            // MARK: Background
            Color(red: 0.114, green: 0.012, blue: 0.106) // #1d031b
                .ignoresSafeArea()
            
            content
        }
    }
    var content: some View {
        ZStack {
            VStack(spacing: 40) {
                
                // MARK: Title
                Text(title)
                    .font(.title)
                    .fontWeight(.semibold)
                
                // MARK: Fasting Plan
                Text(fastingManager.fastingPlan.rawValue)
                    .bold()
                    .padding(.horizontal, 24)
                    .padding(.vertical, 8)
                    .background(.thinMaterial)
                    .cornerRadius(.infinity)
                Spacer()
            }.padding()
            
            VStack(spacing: 40) {
                
                // MARK: Progress Ring
                ProgressRing()
                    .environmentObject(fastingManager)
                
                HStack(spacing: 60){
                    
                    // MARK: Start Time
                    VStack(spacing: 5) {
                        Text(fastingManager.fastingState == .notStarted ? "Start" : "Started")
                            .opacity(0.7)
                        Text(fastingManager.startTime, format:.dateTime.weekday().hour().minute().second())
                            .bold()
                    }
                    
                    // MARK: End Time
                    VStack(spacing: 5) {
                        Text(fastingManager.fastingState == .notStarted ? "End" : "Ends")
                            .opacity(0.7)
                        Text(fastingManager.endTime, format:.dateTime.weekday().hour().minute().second())
                            .bold()
                    }
                    
                    
                }
                
                // MARK: Button
                VStack{
                    Button {
                        fastingManager.toggleFastingState()
                    } label: {
                        Text(fastingManager.fastingState == .fasting ? "End Fasting" : "Start Fasting")
                            .fontWeight(.semibold)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 8)
                            .background(.thinMaterial)
                            .cornerRadius(.infinity)
                    }
                }
            }.padding()
            
            }
            .foregroundColor(.white)
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
