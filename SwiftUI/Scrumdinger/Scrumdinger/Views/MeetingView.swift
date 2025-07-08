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
    @Environment(\.modelContext) private var context
    let scrum: DailyScrum
    @State var scrumTimer = ScrumTimer()
    @Binding var errorWrapper: ErrorWrapper?
    
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
        .onDisappear {
            do {
                try stopScrum()
            } catch {
                errorWrapper = ErrorWrapper(
                    error: error,
                    guidance: "Meeting time was not recorded. Try again later."
                )
            }
        }
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
    
    private func stopScrum() throws {
        scrumTimer.stopScrum()
        
        let newHistory = History(attendees: scrum.attendees)
        scrum.history.insert(newHistory, at: 0)
        
        try context.save()
    }
}

#Preview {
    let scrum = DailyScrum.sampleData[0]
    MeetingView(scrum: scrum, errorWrapper: .constant(nil))
}
