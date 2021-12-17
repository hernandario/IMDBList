//
//  IMBListrepository.swift
//  IMDBList
//
//  Created by Hernán Villamil on 17/12/21.
//

import Foundation

protocol Searchrepository {
    func fetchSearchWithText(_ text: String, completion: @escaping (Result<SearchDTO, Error>) -> Void)
}

class IMDBSearchrepository: Searchrepository {
    func fetchSearchWithText(_ text: String, completion: @escaping (Result<SearchDTO, Error>) -> Void) {
        
    }
}
