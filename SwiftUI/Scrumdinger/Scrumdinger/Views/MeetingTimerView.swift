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
    let isRecording: Bool
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
                    
                    Image(systemName: isRecording ? "mic" : "mic.slash")
                        .font(.title)
                        .padding(.top)
                        .accessibilityLabel(isRecording ? "with transcription" : "without transcription")
                }
                .accessibilityElement(children: .combine)
                .foregroundStyle(theme.accentColor)
            }
            .overlay {
                ForEach(speakers) { speaker in
                    if speaker.isCompleted, let index = speakers.firstIndex(where: { $0.id == speaker.id }) {
                        SpeakerArc(speakerIndex: index, totalSpeakers: speakers.count)
                            .rotation(Angle(degrees: -90))
                            .stroke(theme.mainColor, lineWidth: 12)
                    }                }
            }
            .padding(.horizontal)
    }
}

#Preview {
    let speakers = [
        ScrumTimer.Speaker(name: "Bill", isCompleted: true),
        ScrumTimer.Speaker(name: "Cathy", isCompleted: false)
    ]
    
    MeetingTimerView(speakers: speakers, isRecording: true, theme: .yellow)
}
