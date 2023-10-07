//
//  ErrorView.swift
//  Scrumdinger
//
//  Created by Mustafa Ibrahim on 07/10/2023.
//

import SwiftUI

struct ErrorView: View {
    let errorWrapper: ErrorWrapper
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button("Dissmiss"){
                        dismiss()
                    }
                }
            }
        }
        
    }
}

#Preview {
    enum SampleError: Error {
        case errorRequired
    }
       
    var wrapper: ErrorWrapper {
        ErrorWrapper(
            error: SampleError.errorRequired,
            guidance: "You can safely ignore this error."
        )
    }
   return ErrorView(errorWrapper: wrapper)
}
