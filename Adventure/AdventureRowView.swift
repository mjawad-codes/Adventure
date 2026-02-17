//
//  AdventureRowView.swift
//  Adventure
//
//  Created by Muhammad Jawad on 2026-02-08.
//

import SwiftUI

struct AdventureRowView: View {
    let adventure: Adventure

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(.thinMaterial)
                Text(adventure.emoji)
                    .font(.system(size: 26))
            }
            .frame(width: 44, height: 44)

            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(adventure.title)
                        .font(.headline)
                        .strikethrough(adventure.completed)

                    Spacer()

                    if adventure.completed {
                        Text("Done")
                            .font(.caption.bold())
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .background(Theme.success.opacity(0.15))
                            .foregroundStyle(Theme.success)
                            .clipShape(Capsule())
                    }
                }

                HStack(spacing: 8) {
                    Label("\(adventure.minutes) min", systemImage: "clock")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                    if !adventure.details.isEmpty {
                        Text("•")
                            .foregroundStyle(.secondary)

                        Text(adventure.details)
                            .lineLimit(1)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
                
                if let t = adventure.meetTime {
                    Text("Meet: " + t.formatted(date: .abbreviated, time: .shortened))
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

            }
        }
        .padding(14)
        .background(Theme.card)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .strokeBorder(.separator.opacity(0.35))
        )
    }
}

