//
//  IMBListrepository.swift
//  IMDBList
//
//  Created by Hernán Villamil on 17/12/21.
//

import Foundation
import Alamofire

protocol SearchRepository {
    func fetchSearchWithText(_ text: String, completion: @escaping (Result<SearchDTO, Error>) -> Void)
}

class IMDBSearchRepository {
    private func getParametersForText(_ text: String) -> [String: String] {
        return ["s": text.replacingOccurrences(of: " ", with: "+z"),
                "apikey": RepositoryVariables.apiKey.rawValue]
    }
}

extension IMDBSearchRepository: SearchRepository {
    func fetchSearchWithText(_ text: String, completion: @escaping (Result<SearchDTO, Error>) -> Void) {
        let url = RepositoryVariables.host.rawValue
        let parameters = getParametersForText(text)
        AF.request(url, parameters: parameters, encoder: URLEncodedFormParameterEncoder.default).responseDecodable(of: SearchDTO.self) { (response) in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
