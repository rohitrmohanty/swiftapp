//
//  SupabaseManager.swift
//  BareMinimumTracker
//
//  Created by Rohit R. Mohanty on 26/08/2024.
//

import Supabase
import Foundation

class SupabaseManager {
    static let shared = SupabaseManager()

    let client: SupabaseClient

    init() {
        guard let supabaseURL = SecretsManager.shared.getSecret(forKey: "SUPABASE_URL"),
              let supabaseKey = SecretsManager.shared.getSecret(forKey: "SUPABASE_ANON_KEY"),
              let url = URL(string: supabaseURL) else {
            fatalError("Supabase secrets not configured correctly.")
        }

        self.client = SupabaseClient(supabaseURL: url, supabaseKey: supabaseKey)
    }
    
    func signIn(email: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        Task {
            do {
                let _ = try await client.auth.signIn(email: email, password: password)
                print("Successfully logged in")
                completion(true, nil)
            } catch {
                print("Failed to log in: \(error.localizedDescription)")
                completion(false, error)
            }
        }
    }
}
