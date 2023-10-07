//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by Mustafa Ibrahim on 07/10/2023.
//

import SwiftUI

struct MeetingTimerView: View {
    
    let speakers: [ScrumTimer.Speaker]
    let theme: Theme
    
    private var currentSpeakers: String {
        speakers.first(where: { $0.isCompleted })?.name ?? "Someone"
    }
    
    var body: some View {
        
        Circle()
            .strokeBorder(lineWidth: 24)
            .overlay{
                VStack {
                    Text(currentSpeakers)
                        .font(.title)
                    Text("Is Speaking")
                }
                .accessibilityElement(children: .combine)
                .foregroundStyle(theme.accentColor)
            }
            .overlay{
                ForEach(speakers) {
                    speaker in
                    if speaker.isCompleted, let index = speakers.firstIndex(where: { $0.id == speaker.id }){
                        SpeakerArc(
                            speakerIndex: index,
                            totalSpeakers: speakers.count
                        )
                        .rotation(Angle(degrees: -90))
                        .stroke(theme.mainColor, lineWidth: 12)
                        
                    }
                }
            }
            .padding(.horizontal)
        
    }
}

#Preview {
    var speakers: [ScrumTimer.Speaker] {
            [
                ScrumTimer.Speaker(
                    name: "Bill",
                    isCompleted: true
            ),
                ScrumTimer.Speaker(
                    name: "Cathy",
                    isCompleted: false
                )
            ]
        }
    
  return MeetingTimerView(
    speakers: speakers,
    theme: .bubblegum
  )
}
