//
//  Item.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 25/03/24.
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
