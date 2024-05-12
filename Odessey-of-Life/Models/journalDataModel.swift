//
//  journalDataModel.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 05/04/24.
//

import Foundation
import SwiftData


@Model
class journalDataModel  {
    let id = UUID()
    var entryNote: String
    var entryDateDisplay: String = ""
    @Attribute(.unique) var entryDate: Date
    
    init(entryNote: String, entryDate: Date = Date.now) {
        self.entryNote = entryNote
        self.entryDate = entryDate
    }
    
    
}
