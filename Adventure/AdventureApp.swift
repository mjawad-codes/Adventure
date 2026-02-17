//
//  AdventureApp.swift
//  Adventure
//
//  Created by Muhammad Jawad on 2026-02-08.
//

import SwiftUI

@main
struct AdventureApp: App {
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .tint(Theme.accent)
        }
    }
}

import Foundation

struct Adventure: Identifiable, Codable, Equatable {
    var id = UUID()
    var title: String
    var minutes: Int
    var details: String
    var emoji: String
    var completed: Bool
    var meetTime: Date?
    var meetPlaceName: String
}
