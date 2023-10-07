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
//    @State private var scrum = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $store.scrums) {
                Task {
                    do {
                        try await store.save(scrums: store.scrums)
                    }
                    catch{
                        fatalError(error.localizedDescription)
                    }
                }
            }
            .task {
                do {
                    try await store.load()
                }
                catch{
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
}
