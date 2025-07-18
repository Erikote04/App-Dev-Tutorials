//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Erik Sebastian de Erice Jerez on 3/7/25.
//

import SwiftData
import SwiftUI

struct ScrumsView: View {
    @Query(sort: \DailyScrum.title) private var scrums: [DailyScrum]
    
    @State private var isPresentingNewScrumView: Bool = false
    
    var body: some View {
        NavigationStack {
            List(scrums) { scrum in
                NavigationLink(destination: DetailView(scrum: scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: { isPresentingNewScrumView = true }) {
                    Image(systemName: "plus")
                }
                .frame(width: 44, height: 44)
                .accessibilityLabel("New Scrum")
            }
        }
        .sheet(isPresented: $isPresentingNewScrumView) {
            NewScrumSheet()
        }
    }
}

#Preview(traits: .dailyScrumsSampleData) {
    ScrumsView()
}
