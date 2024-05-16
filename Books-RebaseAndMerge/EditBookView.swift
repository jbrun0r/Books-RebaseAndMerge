//
//  EditBookView.swift
//  Books-RebaseAndMerge
//
//  Created by João Bruno Rodrigues on 16/05/24.
//

import SwiftUI

struct EditBookView: View {
    @Environment(\.dismiss) private var dismiss
    var book: Book
    
    @State private var title: String = .empty
    @State private var author: String = .empty
    @State private var publisher: String = .empty
    @State private var summary: String = .empty
    
    var body: some View {
        VStack(alignment: .leading){
            LabeledContent {
                TextField("", text: $title)
            } label: {
                Text("Título").foregroundStyle(.secondary)
            }
            LabeledContent {
                TextField("", text: $author)
            } label: {
                Text("Autor(a)").foregroundStyle(.secondary)
            }
            LabeledContent {
                TextField("", text: $publisher)
            } label: {
                Text("Editora").foregroundStyle(.secondary)
            }
            Divider()
            Text("Summary").foregroundStyle(.secondary)
            TextEditor(text: $summary)
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color(uiColor: .tertiarySystemFill), lineWidth: 2))
        }
        .padding()
        .textFieldStyle(.roundedBorder)
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if hasChanges() {
                Button("Update") {
                    updateBook()
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .onAppear() {
            loadBookData()
        }
    }
    
    private func hasChanges() -> Bool {
        title != book.title ||
        author != book.author ||
        publisher != book.publisher ||
        summary != book.summary
    }
    
    private func loadBookData() {
        title = book.title
        author = book.author
        publisher = book.publisher
        summary = book.summary
    }
    
    private func updateBook() {
        book.title = title
        book.author = author
        book.publisher = publisher
        book.summary = summary
    }
}

