//
//  DetailRepository.swift
//  IMDBList
//
//  Created by Hernán Villamil on 18/12/21.
//

import Foundation
import Alamofire

protocol DetailRepository {
    func fetchDetailWitIdentifier(_ identifier: String, completion: @escaping (Result<DetailDTO, Error>) -> Void)
}

class IMDBDetailRepository {
    private func getParametersForIdentifier(_ identifier: String) -> [String: String] {
        return ["i": identifier,
                "apikey": RepositoryVariables.apiKey.rawValue]
    }

}

extension IMDBDetailRepository: DetailRepository {
    func fetchDetailWitIdentifier(_ identifier: String, completion: @escaping (Result<DetailDTO, Error>) -> Void) {
        let url = RepositoryVariables.host.rawValue
        let parameters = getParametersForIdentifier(identifier)
        AF.request(url, parameters: parameters, encoder: URLEncodedFormParameterEncoder.default).responseDecodable(of: DetailDTO.self) { (response) in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

