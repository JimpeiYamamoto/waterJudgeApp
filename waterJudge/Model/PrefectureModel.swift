//
//  Prefecture.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2023/01/04.
//

import Foundation

struct PrefectureModel: Decodable {
    
    let id: Int
    let mid: Int
    let name: String
    let municipalities: [MunicipalitlyModel]
    
    func midToName(id: Int) -> String {
        for municipality in self.municipalities {
            if municipality.mid == id {
                return municipality.name
            }
        }
        return "未選択"
    }
}

struct MunicipalitlyModel: Decodable {
    let mid: Int
    let name: String
}
