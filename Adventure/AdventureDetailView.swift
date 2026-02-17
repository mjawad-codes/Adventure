//
//  AdventureDetailView.swift
//  Adventure
//
//  Created by Muhammad Jawad on 2026-02-08.
//

import SwiftUI

import SwiftUI

struct AdventureDetailView: View {
    @Binding var adventure: Adventure

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 14) {
                header

                infoCard

                detailsCard

                completedCard

                meetupCard
            }
            .padding()
            .frame(maxWidth: 700)
            .frame(maxWidth:.infinity, alignment: .center)
        }
        .background(Theme.background)
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var header: some View {
        HStack(spacing: 14) {
            Text(adventure.emoji)
                .font(.system(size: 54))
                .frame(width: 80, height: 80)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))

            VStack(alignment: .leading, spacing: 6) {
                Text(adventure.title)
                    .font(.title2.bold())

                Label("\(adventure.minutes) minutes", systemImage: "clock.fill")
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
    }

    private var infoCard: some View {
        HStack {
            Label("Estimated time", systemImage: "hourglass")
            Spacer()
            Text("\(adventure.minutes) min")
                .font(.headline)
        }
        .padding()
        .background(Theme.card)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }

    private var detailsCard: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label("Description", systemImage: "text.alignleft")
                .font(.headline)

            if adventure.details.isEmpty {
                Text("No description yet.")
                    .foregroundStyle(.secondary)
            } else {
                Text(adventure.details)
                    .foregroundStyle(.primary)
            }
        }
        .padding()
        .background(Theme.card)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }

    private var completedCard: some View {
        HStack {
            Label("Completed", systemImage: adventure.completed ? "checkmark.seal.fill" : "circle")
            Spacer()
            Toggle("", isOn: $adventure.completed)
                .labelsHidden()
        }
        .padding()
        .background(Theme.card)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }

    private var meetupCard: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label("Meetup", systemImage: "calendar.badge.clock")
                .font(.headline)

            if let time = adventure.meetTime {
                Text(time.formatted(date: .abbreviated, time: .shortened))
                    .font(.body)

                if !adventure.meetPlaceName.isEmpty {
                    Label(adventure.meetPlaceName, systemImage: "mappin.and.ellipse")
                        .foregroundStyle(.secondary)
                } else {
                    Text("No location set.")
                        .foregroundStyle(.secondary)
                }
            } else {
                Text("No meetup planned for this adventure.")
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
        .background(Theme.card)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}
