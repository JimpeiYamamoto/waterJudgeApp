//
//  UserAreaInfoView.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2022/12/31.
//

import SwiftUI

struct UserAreaInfoView: View {
    
    @State var userModel: UserModel
    @State var rankModel: RankCellModel
    @State var comments: [CommentCellModel]
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.orange)
                .frame(maxWidth: UIScreen.main.bounds.width / 20 * 19)
                .frame(height: 550)
                .cornerRadius(30)
            
            VStack {
                HStack{
                    Text("あなたの県: ")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text("\(userModel.preName)")
                        .underline()
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                    .frame(
                        maxWidth: UIScreen.main.bounds.width / 5 * 4,
                        alignment: .leading
                    )
                
                ZStack {
                    Rectangle()
                        .frame(maxWidth: UIScreen.main.bounds.width / 20 * 17)
                        .frame(height: 120)
                        .foregroundColor(.red)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                    VStack {
                        HStack {
                            Text("スコア: ")
                                .foregroundColor(.white)
                            Text("\(rankModel.score)")
                                .font(.title)
                                .underline()
                                .foregroundColor(.white)
                        }
                            .frame(
                                maxWidth: UIScreen.main.bounds.width / 5 * 4,
                                alignment: .center
                            )
                        
                        Text("18 / 47 位")
                            .foregroundColor(.white)
                            .font(.title2)
                            .frame(
                                maxWidth: UIScreen.main.bounds.width / 5 * 4,
                                alignment: .center
                            )
                            .padding()
                    }
                }
                .onAppear {
                    if let user = fetchUser() {
                        self.userModel = user
                    } else {
                        self.userModel = UserModel(
                            userName: "", preId: 1, preName: "", muniId: 1, muniName: ""
                        )
                    }
                    self.rankModel = RankCellModel(
                        rank: 18, name: "神奈川県", score: 4.4
                    )
                }
                
                VStack {
                    Text("最新のコメント")
                        .font(.title2)
                        .foregroundColor(.white)
                        .underline()
                        .frame(
                            maxWidth: UIScreen.main.bounds.width / 5 * 4,
                            alignment: .leading
                        )
                        .padding()
                    ForEach(comments, id: \.self.userName) { comment in
                        CommentCellView(commentModel: comment)
                            .frame(maxWidth: UIScreen.main.bounds.width / 5 * 4)
                    }
                }
                .onAppear {
                    self.comments = []
                    self.comments.append(
                        CommentCellModel(
                            userName: "hoge1", comment: "美味しいね", score: 2.2
                        )
                    )
                    self.comments.append(
                        CommentCellModel(
                            userName: "hoge2", comment: "まず...", score: 4.2
                        )
                    )
                    self.comments.append(
                        CommentCellModel(
                            userName: "hoge3", comment: "げぼおおお", score: 3.2
                        )
                    )
                }
            }
        }
    }
}

struct UserAreaInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserAreaInfoView(
            userModel: UserModel(
                userName: "hogeUser",
                preId: 1,
                preName: "hogePre",
                muniId: 1,
                muniName: "hogeMuni"),
            rankModel: RankCellModel(rank: 1, name: "hoge", score: 4.4),
            comments: [CommentCellModel(userName: "hogeuser2", comment: "good", score: 4.4)]
        )
    }
}
