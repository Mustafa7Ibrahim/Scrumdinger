//
//  EditScrumSheet.swift
//  Scrumdinger
//
//  Created by Mustafa Ibrahim on 06/10/2023.
//

import SwiftUI

struct EditScrumSheet: View {
    @Binding var scrum: DailyScrum
    @Binding var isPresentingEditView: Bool
    
    @State private var editedScrum: DailyScrum
    
    init(
        scrum: Binding<DailyScrum>,
        isPresentingEditView: Binding<Bool>
    ) {
        self._scrum = scrum
        self._isPresentingEditView = isPresentingEditView
        self._editedScrum = State(
            initialValue: scrum.wrappedValue
        )
    }

    var body: some View {
        NavigationStack{
            DetailEditView(scrum: $editedScrum)
                .navigationTitle(scrum.title)
                .toolbar{
                    ToolbarItem(placement: .cancellationAction){
                        Button("Cancle"){
                            isPresentingEditView = false
                        }
                    }
                    
                    ToolbarItem(placement: .confirmationAction){
                        Button("Done"){
                            isPresentingEditView = false
                            scrum = editedScrum
                        }
                    }
                }
        }
    }
}

#Preview {
    EditScrumSheet(
        scrum: .constant(DailyScrum.sampleData[0]),
        isPresentingEditView: .constant(true)
    )
}
