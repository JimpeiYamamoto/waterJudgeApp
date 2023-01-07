//
//  CommentCellModelswift.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2022/12/30.
//

import Foundation

struct VoteModel: Codable {
    
    let user: UserModel
    let comment: String
    let score: ScoreModel
    let time: String
}

func fetchVote() -> VoteModel? {
    let key = "vote"
    guard
        let data = UserDefaults.standard.data(forKey: key),
        let savedVote = try? JSONDecoder().decode(VoteModel.self, from: data)
    else { return nil }
    return savedVote
}

func saveVote(vote: VoteModel) {
    let key = "vote"
    if let encodedData = try? JSONEncoder().encode(vote) {
        UserDefaults.standard.set(encodedData, forKey: key)
    }
}
