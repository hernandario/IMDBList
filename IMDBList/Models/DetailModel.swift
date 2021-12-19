//
//  DetailModel.swift
//  IMDBList
//
//  Created by Hernán Villamil on 19/12/21.
//

import Foundation

struct DetailModel {
    let poster: String
    let info: [String]
    
    init(_ detailDTO: DetailDTO) {
        self.poster = detailDTO.poster
        var modelInfo = [String]()
        modelInfo.append("Title: \(detailDTO.title)")
        modelInfo.append("Release date: \(detailDTO.released)")
        modelInfo.append("Duration: \(detailDTO.runtime)")
        modelInfo.append("Genre: \(detailDTO.genre)")
        modelInfo.append("Synopsis: \(detailDTO.plot)")
        modelInfo.append("Web: \(detailDTO.website)")
        self.info = modelInfo
    }
}
