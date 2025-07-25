//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Erik Sebastian de Erice Jerez on 3/7/25.
//

import SwiftData
import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum
    
    @State private var isPresentingEditView = false
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some View {
        List {
            meetingInfoSection()
            attendeesSection()
            historySection()
        }
        .navigationTitle(scrum.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack {
                DetailEditView(scrum: scrum)
                    .navigationTitle(scrum.title)
                
            }
        }
        .sheet(item: $errorWrapper) { wrapper in
            ErrorView(errorWrapper: wrapper)
        }
    }
    
    @ViewBuilder
    private func meetingInfoSection() -> some View {
        Section(header: Text("Meeting Info")) {
            NavigationLink(destination: MeetingView(scrum: scrum, errorWrapper: $errorWrapper)) {
                Label("Start Meeting", systemImage: "timer")
                    .font(.headline)
                    .foregroundStyle(.tint)
            }
            
            HStack {
                Label("Length", systemImage: "clock")
                Spacer()
                Text("\(scrum.lengthInMinutes) minutes")
            }
            .accessibilityElement(children: .combine)
            
            HStack {
                Label("Theme", systemImage: "paintpalette")
                Spacer()
                Text(scrum.theme.name)
                    .padding(4)
                    .foregroundStyle(scrum.theme.accentColor)
                    .background(scrum.theme.mainColor)
                    .clipShape(.rect(cornerRadius: 4))
            }
            .accessibilityElement(children: .combine)
        }
    }
    
    @ViewBuilder
    private func attendeesSection() -> some View {
        Section(header: Text("Attendees")) {
            ForEach(scrum.attendees) { attendee in
                Label(attendee.name, systemImage: "person")
            }
        }
    }
    
    @ViewBuilder
    private func historySection() -> some View {
        Section(header: Text("History")) {
            if scrum.history.isEmpty {
                Label("No meetings yet", systemImage: "calendar.badge.exclamationmark")
            }
            
            ForEach(scrum.history) { history in
                NavigationLink(destination: HistoryView(history: history)) {
                    HStack {
                        Image(systemName: "calendar")
                        Text(history.date, style: .date)
                    }
                }
            }
        }
    }
}

#Preview(traits: .dailyScrumsSampleData) {
    @Previewable @Query(sort: \DailyScrum.title) var scrums: [DailyScrum]
    
    NavigationStack {
        DetailView(scrum: scrums[0])
    }
}
