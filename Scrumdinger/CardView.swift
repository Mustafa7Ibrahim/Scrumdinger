//
//  CardView.swift
//  Scrumdinger
//
//  Created by Mustafa Ibrahim on 05/10/2023.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    var body: some View {
        VStack (alignment: .leading){
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(/*@START_MENU_TOKEN@*/.isHeader/*@END_MENU_TOKEN@*/)
            
            Spacer()
            
            HStack{
                Label(
                    "\(scrum.attendees.count)",
                    systemImage: "person.3"
                )
                .accessibilityLabel("\(scrum.attendees.count) attendees")
                
                
                Spacer()
                
                Label(
                    "\(scrum.lengthInMinutes)",
                    systemImage: "clock"
                )
                .accessibilityLabel("\(scrum.attendees.count) minute meeting")
                .labelStyle(.trailingIcon)
                
            }.font(.caption)
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        
    }
}

#Preview {
    let scrum = DailyScrum.sampleData[1]
    return CardView(scrum: scrum)
        .frame(height: 100)
        .background(scrum.theme.mainColor)
        
}
