//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Mustafa Ibrahim on 05/10/2023.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrum = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrum)
        }
    }
}
