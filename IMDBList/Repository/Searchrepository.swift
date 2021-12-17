//
//  IMBListrepository.swift
//  IMDBList
//
//  Created by Hernán Villamil on 17/12/21.
//

import Foundation

protocol SearchRepository {
    func fetchSearchWithText(_ text: String, completion: @escaping (Result<SearchDTO, Error>) -> Void)
}

class IMDBSearchRepository: SearchRepository {
    func fetchSearchWithText(_ text: String, completion: @escaping (Result<SearchDTO, Error>) -> Void) {
        
    }
}
