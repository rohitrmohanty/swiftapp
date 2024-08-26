//
//  SecretsManager.swift
//  BareMinimumTracker
//
//  Created by Rohit R. Mohanty on 26/08/2024.
//

import Foundation

class SecretsManager {
    static let shared = SecretsManager()

    private var secrets: [String: Any]?

    init() {
        if let path = Bundle.main.path(forResource: "Secrets", ofType: "plist"),
           let data = FileManager.default.contents(atPath: path),
           let secrets = try? PropertyListSerialization.propertyList(from: data, format: nil) as? [String: Any] {
            self.secrets = secrets
        }
    }

    func getSecret(forKey key: String) -> String? {
        return secrets?[key] as? String
    }
}
