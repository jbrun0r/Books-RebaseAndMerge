//
//  NewBookView.swift
//  Books-RebaseAndMerge
//
//  Created by João Bruno Rodrigues on 14/05/24.
//

import SwiftUI

struct NewBookView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = .empty
    @State private var author: String = .empty
    @State private var publisher: String = .empty
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                TextField("Author", text: $author)
                TextField("Publisher", text: $publisher)
                Button("Create") {
                    let newBook = Book(title: title, author: author, publisher: publisher)
                    context.insert(newBook)
                    dismiss()
                }
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
                .disabled(title.isEmpty || author.isEmpty || publisher.isEmpty)
                .navigationTitle("New book")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading){
                        Button("Cancel"){
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NewBookView()
}
