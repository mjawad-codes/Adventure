import SwiftUI

struct AddAdventureView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var adventures: [Adventure]

    @State private var title = ""
    @State private var minutesText = ""
    @State private var details = ""
    @State private var emoji = "✨"
    @State private var meetTimeEnabled = false
    @State private var meetTime = Date()
    @State private var meetPlaceName = ""

    private var minutesValue: Int? {
        Int(minutesText)
    }

    private var canSave: Bool {
        !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        (minutesValue ?? 0) > 0
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Adventure") {
                    TextField("Title", text: $title)

                    TextField("Emoji", text: $emoji)
                        .textInputAutocapitalization(.never)

                    TextField("Minutes", text: $minutesText)
                        .keyboardType(.numberPad)
                }
                
                Section("Meetup") {
                    Toggle("Plan a meetup", isOn: $meetTimeEnabled)
                    
                    if meetTimeEnabled {
                        DatePicker("Meet time", selection: $meetTime, displayedComponents: [.date, .hourAndMinute])
                        
                        TextField("Meet location (e.g. Outside Central Station)", text: $meetPlaceName)
                    }
                }

                Section("Description") {
                    TextField("What will you do?", text: $details, axis: .vertical)
                        .lineLimit(4...8)
                }

                Section {
                    Button {
                        save()
                    } label: {
                        HStack {
                            Spacer()
                            Text("Save Adventure")
                                .font(.headline)
                            Spacer()
                        }
                    }
                    .disabled(!canSave)
                }
            }
            .navigationTitle("Add Adventure")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") { dismiss() }
                }
            }
        }
    }

    private func save() {
        guard let mins = minutesValue, mins > 0 else { return }

        let newOne = Adventure(
            title: title.trimmingCharacters(in: .whitespacesAndNewlines),
            minutes: mins,
            details: details.trimmingCharacters(in: .whitespacesAndNewlines),
            emoji: emoji.isEmpty ? "✨" : emoji,
            completed: false,
            meetTime: meetTimeEnabled ? meetTime: nil,
            meetPlaceName: meetTimeEnabled ? meetPlaceName.trimmingCharacters(in: .whitespacesAndNewlines) : ""
        )

        adventures.append(newOne)
        dismiss()
    }
}
