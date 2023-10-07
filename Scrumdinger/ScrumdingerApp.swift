//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Mustafa Ibrahim on 05/10/2023.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @StateObject private var store =  ScrumStore()
    
    @State private var errorWraper: ErrorWrapper?
    
    // @State private var scrum = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $store.scrums) {
                Task {
                    do {
                        try await store.save(scrums: store.scrums)
                    }
                    catch{
                        errorWraper = ErrorWrapper(
                            error: error,
                            guidance: "Try again later."
                        )
                    }
                }
            }
            .task {
                do {
                    try await store.load()
                }
                catch{
                    errorWraper = ErrorWrapper(
                        error: error,
                        guidance: "Scrumdinger will load sample data and continue."
                    )
                }
            }
            .sheet(item: $errorWraper){
                store.scrums = DailyScrum.sampleData
            } content: { wrapper in
                ErrorView(errorWrapper: wrapper)
                
            }
        }
    }
}
