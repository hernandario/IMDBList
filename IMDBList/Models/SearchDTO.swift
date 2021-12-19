//
//  SearchDTO.swift
//  IMDBList
//
//  Created by Hernán Villamil on 17/12/21.
//

import Foundation

// MARK: - Search
struct SearchDTO: Codable {
    let items: [IMDBItem]
    let totalResults, response: String

    enum CodingKeys: String, CodingKey {
        case items = "Search"
        case totalResults
        case response = "Response"
    }
    
    init(item: IMDBItem) {
        self.items = [item]
        self.totalResults = ""
        self.response = ""
    }
}

// MARK: - SearchElement
struct IMDBItem: Codable {
    let title, year, imdbId: String
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case poster = "Poster"
    }
}
