//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by Erik Sebastian de Erice Jerez on 8/7/25.
//

import SwiftUI
import ThemeKit
import TimerKit

struct MeetingTimerView: View {
    let speakers: [ScrumTimer.Speaker]
    let theme: Theme
    
    private var currentSpeaker: String {
        speakers.first(where: { !$0.isCompleted })?.name ?? "Someone"
    }
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 24)
            .overlay {
                VStack {
                    Text(currentSpeaker)
                        .font(.title)
                    Text("is speaking")
                }
                .accessibilityElement(children: .combine)
                .foregroundStyle(theme.accentColor)
            }
    }
}

#Preview {
    let speakers = [
        ScrumTimer.Speaker(name: "Bill", isCompleted: true),
        ScrumTimer.Speaker(name: "Cathy", isCompleted: false)
    ]
    
    MeetingTimerView(speakers: speakers, theme: .yellow)
}
