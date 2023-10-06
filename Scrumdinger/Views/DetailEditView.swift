//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Mustafa Ibrahim on 05/10/2023.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var scrum: DailyScrum
    @State private var newAttendeeName = ""
    
    var body: some View {
        
        Form{
            Section(header: Text("Meeting Info")) {
                
                TextField("Title", text: $scrum.title)
                
                HStack{
                    Slider(
                        value: $scrum.lengthInMinutesAsDouble,
                        in: 5...30,
                        step: 1
                    ){
                        Text("Length")
                    }
                    .accessibilityLabel(
                        "\(scrum.lengthInMinutes) minutes"
                    )
                    
                    Spacer()
                    
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true)
                }
                
                ThemePicker(selection: $scrum.theme)
            }
            
            Section(header: Text("Attendees")){
                ForEach(scrum.attendees){ attendee in
                    Text(attendee.name)
                }
                .onDelete{
                    indces in
                    scrum.attendees.remove(atOffsets: indces)
                }
                
                HStack{
                    TextField("Name", text: $newAttendeeName)
                    
                    Button(action: {
                        withAnimation{
                            let attende = DailyScrum.Attendee(
                                name: newAttendeeName
                            )
                            scrum.attendees.append(attende)
                            newAttendeeName = ""
                        }
                    }){
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newAttendeeName.isEmpty)
                }
                
                
            }
        }
    }
}

#Preview {
    DetailEditView(scrum: .constant(DailyScrum.sampleData[0]))
}
