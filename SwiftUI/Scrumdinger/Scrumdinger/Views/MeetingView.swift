//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Erik Sebastian de Erice Jerez on 3/7/25.
//

import SwiftUI
import TimerKit

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    @State var scrumTimer = ScrumTimer()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(scrum.theme.mainColor)
            
            VStack {
                MeetingHeader(
                    secondsElapsed: scrumTimer.secondsElapsed,
                    secondsRemaining: scrumTimer.secondsRemaining,
                    theme: scrum.theme
                )
                
                Circle()
                    .strokeBorder(lineWidth: 24)
                
                HStack {
                    Text("Speaker 1 of 3")
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "forward.fill")
                    }
                    .frame(width: 44, height: 44)
                    .accessibilityLabel("Next speaker")
                }
            }
        }
        .padding()
        .foregroundStyle(scrum.theme.accentColor)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    @Previewable @State var scrum = DailyScrum.sampleData[0]
    MeetingView(scrum: $scrum)
}
