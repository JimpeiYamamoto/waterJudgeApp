//
//  RankCellModel.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2022/12/30.
//

import Foundation

struct AllRankModel {
    let name: String
    
    let allRank: RankModel
    let tasteRank: RankModel
    let smellRank: RankModel
    let colorRank: RankModel
}

struct RankModel {
    let name: String
    let score: Double
    let rank: Int
}
