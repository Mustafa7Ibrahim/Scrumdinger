//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Mustafa Ibrahim on 06/10/2023.
//

import SwiftUI

struct MeetingHeaderView: View {
    let secondsElapsed: Int
    let secondsRemaining: Int
    let theme: Theme
    
    private var totalSecounds: Int {
        secondsElapsed + secondsRemaining
    }
    
    private var progress: Double {
        guard totalSecounds > 0 else { return 1 }
        return Double(secondsElapsed) / Double(totalSecounds)
    }
    
    private var menutesRemaining: Int{
        secondsRemaining / 60
    }
    
    var body: some View {
        VStack{
            ProgressView(value: progress)
                .progressViewStyle(
                    ScrumProgressViewStyle(theme: theme)
                )
            
            HStack{
                
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed").font(.caption)
                    Label(
                        "\(secondsElapsed)",
                        systemImage: "hourglass.tophalf.fill"
                    )
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining").font(.caption)
                    Label(
                        "\(secondsRemaining)",
                        systemImage: "hourglass.bottomhalf.fill"
                    )
                    .labelStyle(.trailingIcon)
                }
            }
            
        }
        .accessibilityElement(children: /*@START_MENU_TOKEN@*/.ignore/*@END_MENU_TOKEN@*/)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(menutesRemaining) minutes")
        .padding([.top, .horizontal])
    }
}

#Preview {
    MeetingHeaderView(
        secondsElapsed: 900,
        secondsRemaining: 700,
        theme: .bubblegum
    )
}
