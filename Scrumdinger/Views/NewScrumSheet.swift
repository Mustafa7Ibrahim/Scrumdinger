//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Mustafa Ibrahim on 06/10/2023.
//

import SwiftUI

struct NewScrumSheet: View {
    @State private var newScrum = DailyScrum.emptyScrum
    @Binding var scrum: [DailyScrum]
    @Binding var isPresentingNewScrumView: Bool
    
    var body: some View {
        NavigationStack{
            DetailEditView(scrum: $newScrum)
                .toolbar{
                    ToolbarItem(placement: .cancellationAction){
                        Button("Dismiss"){
                            isPresentingNewScrumView = false
                        }
                    }
                    
                    ToolbarItem(placement: .confirmationAction){
                        Button("Add"){
                            scrum.append(newScrum)
                            isPresentingNewScrumView = false
                        }
                    }
                }
        }
    }
}

#Preview {
    NewScrumSheet(
        scrum: .constant(DailyScrum.sampleData),
        isPresentingNewScrumView: .constant(true)
    )
}
