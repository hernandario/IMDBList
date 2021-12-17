//
//  SearchDTO.swift
//  IMDBList
//
//  Created by Hernán Villamil on 17/12/21.
//

import Foundation

// MARK: - Search
struct SearchDTO: Codable {
    let search: [IMDBItem]
    let totalResults, response: String

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}

// MARK: - SearchElement
struct IMDBItem: Codable {
    let title, year, imdbId: String
    let type: ItemType
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}

enum ItemType: String, Codable {
    case movie = "movie"
}
