//
//  Item.swift
//  BareMinimumTracker
//
//  Created by Rohit R. Mohanty on 26/08/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
