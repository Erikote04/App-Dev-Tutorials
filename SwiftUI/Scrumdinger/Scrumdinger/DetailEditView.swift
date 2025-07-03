//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Erik Sebastian de Erice Jerez on 3/7/25.
//

import SwiftUI

struct DetailEditView: View {
    @State private var scrum = DailyScrum.emptyScrum
    
    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrum.title)
                
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    
                    Spacer()
                    
                    Text("\(scrum.lengthInMinutes) minutes")
                }
            }
        }
    }
}

#Preview {
    DetailEditView()
}
