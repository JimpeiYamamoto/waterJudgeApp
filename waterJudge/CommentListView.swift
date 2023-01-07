//
//  CommentListView.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2022/12/30.
//

import SwiftUI

struct CommentListView: View {
    
    let rankModel: RankModel
    var commentCellModels: [CommentCellModel]
    
    init(rankModel: RankModel) {
        self.rankModel = rankModel
        self.commentCellModels = []
        
        // TODO: DBからフェッチ
        self.commentCellModels.append(
            CommentCellModel(
                user: UserModel(userName: "hoge1", preId: 1, preName: "pre", muniId: 1, muniName: "muni"),
                comment: "とても美味しいわ",
                score: ScoreModel(taste: 3.0, smell: 4.0, color: 1.0),
                time: "2022-10/4-23:33")
            
        )
        self.commentCellModels.append(
            CommentCellModel(
                user: UserModel(userName: "hoge1", preId: 1, preName: "pre", muniId: 1, muniName: "muni"),
                comment: "とても美味しいわ",
                score: ScoreModel(taste: 3.0, smell: 4.0, color: 1.0),
                time: "2022-10/4-23:33")
            
        )
        self.commentCellModels.append(
            CommentCellModel(
                user: UserModel(userName: "hoge1", preId: 1, preName: "pre", muniId: 1, muniName: "muni"),
                comment: "とても美味しいわ",
                score: ScoreModel(taste: 3.0, smell: 4.0, color: 1.0),
                time: "2022-10/4-23:33")
            
        )
        self.commentCellModels.append(
            CommentCellModel(
                user: UserModel(userName: "hoge1", preId: 1, preName: "pre", muniId: 1, muniName: "muni"),
                comment: "とても美味しいわ",
                score: ScoreModel(taste: 3.0, smell: 4.0, color: 1.0),
                time: "2022-10/4-23:33")
            
        )
    }
    
    var body: some View {
        ScrollView {
            ForEach(commentCellModels, id: \.self.user.userName) { model in
                CommentCellView(commentModel: model)
            }
        }
        .navigationTitle("\(rankModel.name)")
    }
}

struct CommentListView_Previews: PreviewProvider {
    static var previews: some View {
        CommentListView(
            rankModel: RankModel(name: "神奈川県横浜市", score: 3.8, rank: 237)
        )
    }
}
