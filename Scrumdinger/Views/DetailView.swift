//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Mustafa Ibrahim on 05/10/2023.
//

import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    
    @State private var editingScrum = DailyScrum.emptyScrum
    @State private var isPresentingEditView = false
    
    var body: some View {
        // main Screen
        List{
            Section(header: Text("Meeting Info")){
                NavigationLink(
                    destination: MeetingView(scrum: $scrum)
                ) {
                    Label(
                        "Start Metting",
                        systemImage: "timer"
                    )
                    .font(.headline)
                    .foregroundColor(.accentColor)
                }
                
                HStack{
                    Label(
                        "Length",
                        systemImage: "clock"
                    )
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                
                HStack{
                    Label(
                        "Theme",
                        systemImage: "paintpalette"
                    )
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .clipShape(
                           RoundedRectangle(cornerRadius: 4)
                        )
                }
                
            }
            
            Section(header: Text("Attendee")){
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
            
            Section(header: Text("History")){
                if scrum.history.isEmpty {
                    Label(
                        "no meetings yet",
                        systemImage: "calendar.badge.exclamationmark"
                    )
                }
                ForEach(scrum.history) { history in
                    NavigationLink(destination: HistoryView(history: history)) {
                        HStack{
                            Image(systemName: "calendar")
                            Text(history.date, style: .date)
                        }
                    }
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar{
            Button("Edit"){
                isPresentingEditView = true
                editingScrum = scrum
            }
        }
        
        
        
        
        // sheet
        .sheet(isPresented: $isPresentingEditView){
            EditScrumSheet(
                scrum: $scrum,
                isPresentingEditView: $isPresentingEditView
            )
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
