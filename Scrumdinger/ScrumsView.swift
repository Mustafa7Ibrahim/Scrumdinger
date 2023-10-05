//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Mustafa Ibrahim on 05/10/2023.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    
    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                NavigationLink(
                    destination: DetailView(scrum: $scrum)
                ) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrum")
            .toolbar{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
                
            }
        }
    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData))
}
