//
//  BookModel.swift
//  bookstore
//
//  Created by 채나연 on 5/8/24.
//

import Foundation

struct BookModel: Codable {
    let documents: [Document]
}

// MARK: - Document
struct Document: Codable {
    let authors: [String]
    let contents: String
    let price: Int
    let thumbnail: String
    let title: String
}
