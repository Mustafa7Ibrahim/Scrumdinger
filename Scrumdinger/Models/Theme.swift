//
//  Theme.swift
//  Scrumdinger
//
//  Created by Mustafa Ibrahim on 05/10/2023.
//

import Foundation
import SwiftUI

enum Theme : String , CaseIterable, Identifiable, Codable {
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    var accentColor: Color {
        switch self {
        case .bubblegum,
                .buttercup,
                .lavender,
                .orange,
                .periwinkle,
                .poppy,
                .seafoam,
                .sky,
                .tan,
                .teal,
                .yellow
            : return .black
            
        case .indigo,
                .magenta,
                .navy,
                .oxblood,
                .purple
            :return .white
        }
    }
    
    var mainColor: Color {
            switch self {
            case .bubblegum: return Color.pink
            case .buttercup: return Color.yellow
            case .indigo: return Color.blue
            case .lavender: return Color.purple
            case .magenta: return Color.mint
            case .navy: return Color.blue
            case .orange: return Color.orange
            case .oxblood: return Color.red
            case .periwinkle: return Color.blue
            case .poppy: return Color.red
            case .purple: return Color.purple
            case .seafoam: return Color.green
            case .sky: return Color.blue
            case .tan: return Color.orange
            case .teal: return Color.green
            case .yellow: return Color.yellow
            }
        }
    
    var name: String {
        rawValue.capitalized
    }
    
    var id: String{
        name
    }
}
