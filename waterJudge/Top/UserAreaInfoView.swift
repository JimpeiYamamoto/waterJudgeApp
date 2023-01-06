//
//  UserAreaInfoView.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2022/12/31.
//

import SwiftUI

struct UserAreaInfoView: View {
    
    let userModel: UserModel
    let rankModel: RankCellModel
    let comments: [CommentCellModel]
    
    var body: some View {
        HStack(alignment: .top) {
            VStack {
                VStack(alignment: .leading){
                    Text("\(userModel.preName)")
                        .font(.headline)
                        .padding(.bottom, 5)
                    VStack{
                        Text("スコア: \(String(rankModel.score))")
                            .font(.title2)
                            .padding(.top, 10)
                        Text("\(rankModel.rank) / 47")
                            .font(.title3)
                            .padding(.bottom, 10)
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width / 2)
                    .background(
                        Rectangle()
                            .foregroundColor(.brown)
                            .cornerRadius(10)
                    )
                }
            }
            .frame(maxWidth: UIScreen.main.bounds.width / 2)
            
            VStack(alignment: .leading) {
                Text("最新コメント")
                    .font(.headline)
                ForEach(comments, id: \.self.user.userName) { comment in
                    CommentCellView(commentModel: comment)
                        .cornerRadius(5)
                }
            }
            .frame(maxWidth: UIScreen.main.bounds.width / 2)
        }
        .frame(height: 250)
        .padding(10)
        .background(
            Rectangle()
                .foregroundColor(.indigo)
                .cornerRadius(10)
        )
    }
}

struct UserAreaInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserAreaInfoView(
            userModel: UserModel(
                userName: "hogeUser",
                preId: 1,
                preName: "北海道",
                muniId: 1,
                muniName: "札幌市"),
            rankModel: RankCellModel(rank: 1, name: "hoge", score: 4.4),
            comments: [
                CommentCellModel(
                    user: UserModel(
                        userName: "user1",
                        preId: 1,
                        preName: "hogepre",
                        muniId: 1,
                        muniName: "hogemuni"),
                    comment: "美味しい美味しい",
                    score: ScoreModel(taste: 1.0, smell: 2.0, color: 3.0),
                    time: "2022-12/31-09:12"
                ),
                CommentCellModel(
                    user: UserModel(
                        userName: "user1",
                        preId: 1,
                        preName: "hogepre",
                        muniId: 1,
                        muniName: "hogemuni"),
                    comment: "美味しい美味しい",
                    score: ScoreModel(taste: 1.0, smell: 2.0, color: 3.0),
                    time: "2022-12/31-09:12"
                ),
                CommentCellModel(
                    user: UserModel(
                        userName: "user1",
                        preId: 1,
                        preName: "hogepre",
                        muniId: 1,
                        muniName: "hogemuni"),
                    comment: "美味しい美味しい",
                    score: ScoreModel(taste: 1.0, smell: 2.0, color: 3.0),
                    time: "2022-12/31-09:12"
                )
            ]
        )
    }
}
