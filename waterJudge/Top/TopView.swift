//
//  TopView.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2022/12/29.
//

import SwiftUI

struct HomeView: View {
    
    @State var userModel: UserModel
    @State var rankModel: RankCellModel
    @State var comments: [CommentCellModel]
    
    init() {
        self.userModel = fetchUser()!
        self.rankModel = RankCellModel(rank: 1, name: "hoge", score: 3.8)
        self.comments = []
    }
    
    var body: some View {
        
        NavigationView{
            List {
                Section("基本情報") {
                    TabView {
                        UserAreaInfoView(
                            userModel: userModel,
                            rankModel: rankModel,
                            comments: comments
                        )
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
                            
                            self.comments = []
                            self.comments.append(
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
                            )
                            self.comments.append(
                                CommentCellModel(
                                    user: UserModel(
                                        userName: "user2",
                                        preId: 1,
                                        preName: "hogepre",
                                        muniId: 1,
                                        muniName: "hogemuni"),
                                    comment: "美味しい美味しい",
                                    score: ScoreModel(taste: 1.0, smell: 2.0, color: 3.0),
                                    time: "2022-12/31-09:12"
                                )
                            )
                            self.comments.append(
                                CommentCellModel(
                                    user: UserModel(
                                        userName: "user3",
                                        preId: 1,
                                        preName: "hogepre",
                                        muniId: 1,
                                        muniName: "hogemuni"),
                                    comment: "美味しい美味しい",
                                    score: ScoreModel(taste: 1.0, smell: 2.0, color: 3.0),
                                    time: "2022-12/31-09:12"
                                )
                            )
                            
                        }
                        
                        UserAreaInfoView(
                            userModel: userModel,
                            rankModel: rankModel,
                            comments: comments
                        )
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
                            
                            self.comments = []
                            self.comments.append(
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
                            )
                            self.comments.append(
                                CommentCellModel(
                                    user: UserModel(
                                        userName: "user2",
                                        preId: 1,
                                        preName: "hogepre",
                                        muniId: 1,
                                        muniName: "hogemuni"),
                                    comment: "美味しい美味しい",
                                    score: ScoreModel(taste: 1.0, smell: 2.0, color: 3.0),
                                    time: "2022-12/31-09:12"
                                )
                            )
                            self.comments.append(
                                CommentCellModel(
                                    user: UserModel(
                                        userName: "user3",
                                        preId: 1,
                                        preName: "hogepre",
                                        muniId: 1,
                                        muniName: "hogemuni"),
                                    comment: "美味しい美味しい",
                                    score: ScoreModel(taste: 1.0, smell: 2.0, color: 3.0),
                                    time: "2022-12/31-09:12"
                                )
                            )
                            
                        }
                        
                        VStack {
                            Best3View(
                                title: "\(userModel.preName)内",
                                rank1Model: RankCellModel(rank: 1, name: "川崎市", score: 4.75),
                                rank2Model: RankCellModel(rank: 2, name: "横浜市", score: 4.43),
                                rank3Model: RankCellModel(rank: 3, name: "相模原市", score: 2.32)
                            )
                            Best3View(
                                title: "\(userModel.preName)内",
                                rank1Model: RankCellModel(rank: 1, name: "川崎市", score: 4.75),
                                rank2Model: RankCellModel(rank: 2, name: "横浜市", score: 4.43),
                                rank3Model: RankCellModel(rank: 3, name: "相模原市", score: 2.32)
                            )
                        }
                        
                        
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .frame(height: 270)
                    
                }
                
                Section("ランキング") {
                    Best3View(
                        title: "都道府県",
                        rank1Model: RankCellModel(rank: 1, name: "東京都", score: 4.75),
                        rank2Model: RankCellModel(rank: 2, name: "神奈川県", score: 4.43),
                        rank3Model: RankCellModel(rank: 3, name: "大阪府", score: 2.32)
                    )
                    
                    Best3View(
                        title: "全国市区町村",
                        rank1Model: RankCellModel(rank: 1, name: "川崎市", score: 4.75),
                        rank2Model: RankCellModel(rank: 2, name: "八王子市", score: 4.43),
                        rank3Model: RankCellModel(rank: 3, name: "文京区", score: 2.32)
                    )
                }
                
            }
            .listStyle(.plain)
            .navigationTitle("2022-12/29")
            .navigationBarItems(leading:Button(action: {
            }, label: {
                NavigationLink {
                    EditUserInfoView()
                } label: {
                    Image(systemName: "person.circle.fill")
                }

            }))
            
        }
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
