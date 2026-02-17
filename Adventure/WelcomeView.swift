//
//  WelcomeView.swift
//  Adventure
//
//  Created by Muhammad Jawad on 2026-02-08.
//

import SwiftUI

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Theme.gradient
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Spacer()

                    Image(systemName: "map.fill")
                        .font(.system(size: 46, weight: .bold))
                        .foregroundStyle(Theme.success)
                        .padding(18)
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))

                    Text("Adventure Buddies")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.primary)

                    Text("Collect tiny adventures.\nStay curious. Mark them done.")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)

                    VStack(alignment: .leading, spacing: 10) {
                        Label("Add adventures in seconds", systemImage: "plus.circle.fill")
                        Label("Track time & details", systemImage: "clock.fill")
                        Label("Mark completed ✅", systemImage: "checkmark.seal.fill")
                    }
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Theme.card)
                    .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                    .padding(.horizontal)

                    NavigationLink {
                        ContentView()
                    } label: {
                        HStack {
                            Text("Start")
                            Image(systemName: "arrow.right")
                        }
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Theme.primary)
                    .padding(.horizontal)

                    Spacer()
                }
                .padding()
                .frame(maxWidth: 600)
                .frame(maxWidth: .infinity)
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}


#Preview {
    WelcomeView()
}
