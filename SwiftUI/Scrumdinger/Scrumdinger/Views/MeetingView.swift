//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Erik Sebastian de Erice Jerez on 3/7/25.
//

import SwiftUI
import TimerKit
import AVFoundation

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    @State var scrumTimer = ScrumTimer()
    
    private let player = AVPlayer.dingPlayer()
    
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
                
                MeetingFooter(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            }
        }
        .padding()
        .foregroundStyle(scrum.theme.accentColor)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear { startScrum() }
        .onDisappear { stopScrum() }
    }
    
    private func startScrum() {
        scrumTimer.reset(
            lengthInMinutes: scrum.lengthInMinutes,
            attendeeNames: scrum.attendees.map { $0.name }
        )
        
        scrumTimer.speakerChangedAction = {
            player.seek(to: .zero)
            player.play()
        }
        
        scrumTimer.startScrum()
    }
    
    private func stopScrum() {
        scrumTimer.stopScrum()
        
        let newHistory = History(attendees: scrum.attendees)
        scrum.history.insert(newHistory, at: 0)
    }
}

#Preview {
    @Previewable @State var scrum = DailyScrum.sampleData[0]
    MeetingView(scrum: $scrum)
}
