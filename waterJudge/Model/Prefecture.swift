//
//  Prefecture.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2023/01/04.
//

import Foundation

struct Prefecture: Decodable {
    let id: Int
    let mid: Int
    let name: String
    let municipalities: [Municipalitly]
}

struct Municipalitly: Decodable {
    let mid: Int
    let name: String
}
