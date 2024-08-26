//
//  User.swift
//  BareMinimumTracker
//
//  Created by Rohit R. Mohanty on 26/08/2024.
//

import Foundation
import SwiftData

@Model
final class User {
    var email: String

    init(email: String) {
        self.email = email
    }
}
