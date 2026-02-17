import SwiftUI

enum Theme {
    // Accent (keep your brand)
    static let primary = Color(red: 0.28, green: 0.55, blue: 0.45)
    static let accent  = Color(red: 0.20, green: 0.55, blue: 0.60)
    static let success = Color(red: 0.35, green: 0.65, blue: 0.45)

    
    static let background = Color(.systemBackground)
    static let card = Color(.secondarySystemBackground)

    
    static let gradient = LinearGradient(
        colors: [Color(.systemBackground), Color(.secondarySystemBackground)],
        startPoint: .top,
        endPoint: .bottom
    )
}
