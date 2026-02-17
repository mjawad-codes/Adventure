import SwiftUI

struct AdventureStorage {

    private static let key = "adventures_storage"

    static func load() -> [Adventure] {
        guard
            let data = UserDefaults.standard.data(forKey: key),
            let adventures = try? JSONDecoder().decode([Adventure].self, from: data)
        else {
            return []
        }
        return adventures
    }

    static func save(_ adventures: [Adventure]) {
        if let data = try? JSONEncoder().encode(adventures) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}
