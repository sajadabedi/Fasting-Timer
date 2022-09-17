//
//  ProgressRing.swift
//  FastingTimer
//
//  Created by Sajad Abedi on 17.09.2022.
//

import SwiftUI

struct ProgressRing: View {
    @State var progress = 0.0
    var body: some View {
        ZStack {
            // MARK: Placeholder Ring
            Circle()
                .stroke(lineWidth: 20)
                .foregroundColor(.gray)
                .opacity(0.1)
            
            // MARK: Colored Ring
            Circle()
                .trim(from: 0.0, to: min(progress, 1.0))
                .stroke(AngularGradient(gradient: Gradient(colors: [.blue, .pink, .purple, .cyan, .teal,.blue]), center: .center), style: StrokeStyle.init(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeInOut(duration: 1.0), value: progress)
            
            VStack(spacing: 30) {
                
                // MARK: Elapsed Time
                VStack(spacing: 5) {
                    Text("Elapsed Time")
                        .opacity(0.7)
                    Text("0:00")
                        .font(.title)
                        .bold()
                }
                .padding(.top)
                
                // MARK: Remaining Time
                VStack(spacing: 5) {
                    Text("Remaining Time")
                        .opacity(0.7)
                    Text("0:00")
                        .font(.title2)
                        .bold()
                }
            }
        }
        .frame(width: 250, height: 250)
        .padding()
        .onAppear{
            progress = 1
        }
    }
}

struct ProgressRing_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRing()
    }
}
