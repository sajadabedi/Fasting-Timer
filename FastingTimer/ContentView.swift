//
//  ContentView.swift
//  FastingTimer
//
//  Created by Sajad Abedi on 17.09.2022.
//

import SwiftUI

struct ContentView: View {
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
                Text("Let's get started")
                    .font(.system(.largeTitle,design: .rounded))
                
                // MARK: Fasting Plan
                Text("16:8")
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
                
                HStack(spacing: 60){
                    
                    // MARK: Start Time
                    VStack(spacing: 5) {
                        Text("Start")
                            .opacity(0.7)
                        Text(Date(), format:.dateTime.weekday().hour().minute().second())
                            .bold()
                    }
                    
                    // MARK: End Time
                    VStack(spacing: 5) {
                        Text("End")
                            .opacity(0.7)
                        Text(Date(), format:.dateTime.weekday().hour().minute().second())
                            .bold()
                    }
                    
                    
                }
                
                // MARK: Button
                VStack{
                    Button {
                        
                    } label: {
                        Text("Start Fasting")
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
