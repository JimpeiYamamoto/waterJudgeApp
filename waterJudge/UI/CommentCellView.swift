//
//  CommentCellView.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2022/12/30.
//

import SwiftUI

struct CommentCellView: View {
    
    let commentModel: VoteModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack() {
                Image(systemName: "person")
                    .foregroundColor(.white)
                Text(commentModel.user.userName)
                    .underline()
                    .foregroundColor(.white)
                Spacer()
                Text(String(round(commentModel.score.all * 100) / 100))
                    .foregroundColor(.white)
            }
            
            HStack {
                Text(commentModel.comment)
                    .foregroundColor(.white)
            }
            
        }
        .padding(5)
        .background(
            Rectangle()
                .foregroundColor(.green)
        )
    }
}

struct CommentCellView_Previews: PreviewProvider {
    static var previews: some View {
        CommentCellView(
            commentModel:VoteModel(
                voteId: 1,
                user: UserModel(
                    userId: 1,
                    userName: "hoge1",
                    preId: 1,
                    preName: "pre",
                    muniId: 1,
                    muniName: "muni"
                ),
            comment: "とても美味しいわ",
            score: ScoreModel(taste: 3.0, smell: 4.0, color: 1.0),
            time: "2022-10/4-23:33")
        )
    }
}
