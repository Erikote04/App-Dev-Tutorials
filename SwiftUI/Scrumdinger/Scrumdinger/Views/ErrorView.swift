//
//  ErrorView.swift
//  Scrumdinger
//
//  Created by Erik Sebastian de Erice Jerez on 8/7/25.
//

import SwiftUI

struct ErrorView: View {
    let errorWrapper: ErrorWrapper
    
    var body: some View {
        VStack {
            Text("An error has occurred!")
                .font(.title)
                .padding(.bottom)
            
            Text(errorWrapper.error.localizedDescription)
                .font(.headline)
            
            Text(errorWrapper.guidance)
                .font(.caption)
                .padding(.top)
            
            Spacer()
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(.rect(cornerRadius: 16))
    }
}

private enum SampleError: Error {
    case errorRequired
}

#Preview {
    ErrorView(errorWrapper: ErrorWrapper(
        error: SampleError.errorRequired,
        guidance: "You can safely ignore this error.")
    )
}
