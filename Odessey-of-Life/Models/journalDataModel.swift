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
    var entryDate: Date
    
    init(entryNote: String, entryDate: Date) {
        self.entryNote = entryNote
        self.entryDate = entryDate
    }
    
    
}
