//
//  Book.swift
//  Books-RebaseAndMerge
//
//  Created by João Bruno Rodrigues on 10/05/24.
//

import SwiftData

@Model
class Book {
    var title: String
    var author: String
    var publisher: String
    var summary: String
    
    init(title: String, author: String, publisher: String, summary: String = .empty) {
        self.title = title
        self.author = author
        self.publisher = publisher
        self.summary = summary
    }
    
}
