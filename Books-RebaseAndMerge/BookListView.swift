//
//  BookListView.swift
//  Books-RebaseAndMerge
//
//  Created by João Bruno Rodrigues on 10/05/24.
//

import SwiftData
import SwiftUI

struct BookListView: View {
    
    @Environment(\.modelContext) private var context
    @Query(sort: \Book.title) private var books: [Book]
    
    @State private var createNewBook = false
    var body: some View {
        NavigationStack{
            Group{
                if !books.isEmpty {
                    List{
                        ForEach(books) { book in
                            NavigationLink{
                                EditBookView(book: book)
                            } label: {
                                HStack(spacing: 16) {
                                    VStack(alignment: .leading) {
                                        Text(book.title)
                                            .font(.title)
                                        HStack(spacing: 8) {
                                            Text(book.author)
                                                .foregroundStyle(.secondary)
                                            Text(book.publisher)
                                                .foregroundStyle(.secondary)
                                        }
                                    }
                                }
                            }
                        }
                        .onDelete { indexSet in
                            for index in indexSet {
                                let book = books[index]
                                context.delete(book)
                            }
                        }
                    }
                }
                else {
                    ContentUnavailableView("Enter your first book.", systemImage: "book.fill")
                }
            }
            .listStyle(.plain)
            .navigationTitle("My books")
            .toolbar {
                Button {
                    createNewBook = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .imageScale(.large)
                }
            }
            .sheet(isPresented: $createNewBook, content: {
                NewBookView()
            })
        }
    }
}
    
    
#Preview {
    BookListView()
        .modelContainer(for: Book.self, inMemory: true)
}
