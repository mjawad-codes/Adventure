//
//  ContentView.swift
//  Adventure
//
//  Created by Muhammad Jawad on 2026-02-08.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("adventures_storage") private var adventuresData: Data = Data()
    @State private var adventures: [Adventure] = []

    @State private var showAdd = false

    var body: some View {
        NavigationStack {
            
            ZStack {
                Theme.background.ignoresSafeArea()
                
                List {
                    ForEach(adventures.indices, id: \.self) { index in
                        NavigationLink {
                            AdventureDetailView(adventure: $adventures[index])
                        } label: {
                            AdventureRowView(adventure: adventures[index])
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                    }
                    .onDelete { indexSet in
                        adventures.remove(atOffsets: indexSet)
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .frame(maxWidth: 700)
                .navigationTitle("Adventure Buddies")
            }
        
            .toolbar {
                Button {
                    showAdd = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAdd) {
                AddAdventureView(adventures: $adventures)
            }
        }
        .onAppear {
            let saved = AdventureStorage.load()

            if saved.isEmpty {
                adventures = [
                    Adventure(title: "Forest Walk", minutes: 30, details: "Take a relaxing walk.", emoji: "🌲", completed: false, meetPlaceName: "Pildammsparken"),
                    Adventure(title: "Cafe Visit", minutes: 45, details: "Try a new drink.", emoji: "☕️", completed: false, meetPlaceName: "Stortorget")
                ]
            } else {
                adventures = saved
            }
        }
        .onChange(of: adventures) { _, newValue in
            AdventureStorage.save(newValue)
        }

    }
}



#Preview {
    ContentView()
}
