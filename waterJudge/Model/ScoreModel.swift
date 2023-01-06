//
//  File.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2023/01/06.
//

import Foundation

struct ScoreModel {
    let all: Double
    let taste: Double
    let smell: Double
    let color: Double
    
    init(taste: Double, smell: Double, color: Double) {
        self.taste = taste
        self.smell = smell
        self.color = color
        self.all = (taste + smell + color) / 3
    }
}
