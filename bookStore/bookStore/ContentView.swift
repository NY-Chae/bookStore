//
//  ContentView.swift
//  bookStore
//
//  Created by 채나연 on 5/5/24.
//

import SwiftUI


struct Book: Codable {
let id: Int
let login: String
let avatarUrl: String
}

struct ContentView: View {
    
    
    @State private var books: [Book] = []
    @State private var searchTerm = ""
    
    var filteredBoooks: [Book] {
        guard !searchTerm.isEmpty else { return books }
        return books.filter { $0.login.localizedCaseInsensitiveContains("serchTerm")}
    }
    
    var body: some View {
        List(filteredBoooks, id: \.id) { book in
            HStack(spacing: 20) {
                AsyncImage(url: URL(string: book.avatarUrl)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                } placeholder: {
                    Circle()
                        .foregroundColor(.secondary)
                }
                .frame(width: 44, height: 44)
                
                Text(book.login)
                    .font(.title3)
                    .fontWeight(.medium)
            }
        }
        .navigationTitle("Books")
        .task { books = await getBooks() }
        .searchable(text: $searchTerm, prompt: "Search Books")
    }
    
    func getBooks() async -> [Book] {
        let url = URL(string: "https://dapi.kakao.com/v3/search/book")!
        let (data, _) = try! await URLSession.shared.data(from:url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try! decoder.decode([Book].self, from: data)
        
    }
}
