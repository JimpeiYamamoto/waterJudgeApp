//
//  CommentListView.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2022/12/30.
//

import SwiftUI

struct CommentListView: View {
    
    let rankModel: RankCellModel
    var commentCellModels: [CommentCellModel]
    
    init(rankModel: RankCellModel) {
        self.rankModel = rankModel
        self.commentCellModels = []
        self.commentCellModels.append(
            CommentCellModel(userName: "hoge1", comment: "うまい", score: 1.2)
        )
        self.commentCellModels.append(
            CommentCellModel(userName: "hoge2", comment: "まずい", score: 4.8)
        )
        self.commentCellModels.append(
            CommentCellModel(userName: "hoge3", comment: "ちょっと臭いね", score: 3.2)
        )
        self.commentCellModels.append(
            CommentCellModel(userName: "hoge4", comment: "なんじゃこりゃ", score: 4.9)
        )
    }
    
    var body: some View {
        ScrollView {
            ForEach(commentCellModels, id: \.self.userName) { model in
                CommentCellView(comment: model.comment, score: model.score)
            }
        }
        .navigationTitle("\(rankModel.name)")
    }
}

struct CommentListView_Previews: PreviewProvider {
    static var previews: some View {
        CommentListView(
            rankModel: RankCellModel(
                rank: 1,
                name: "神奈川県",
                score: 4.2
            )
        )
    }
}
