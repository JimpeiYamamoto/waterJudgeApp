//
//  TopView.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2022/12/29.
//

import SwiftUI


struct HomeView: View {
    
    @State var userModel: UserModel
    @State var preRankModel: AllRankModel
    @State var muniRankModel: AllRankModel
    
    init() {
        // TODO: Fix force unwrap
        let user = fetchUser()!
            
        self.userModel = user
        self.preRankModel = AllRankModel(
            name: user.preName,
            allRank: RankModel(
                name: user.preName, score: 4.3, rank: 4
            ),
            tasteRank: RankModel(
                name: user.preName, score: 4.1, rank: 11
            ),
            smellRank: RankModel(
                name: user.preName, score: 4.4, rank: 2
            ),
            colorRank: RankModel(
                name: user.preName, score: 4.3, rank: 3
            )
        )
        
        self.muniRankModel = AllRankModel(
            name: user.muniName,
            allRank: RankModel(
                name: user.muniName, score: 4.3, rank: 4
            ),
            tasteRank: RankModel(
                name: user.muniName, score: 4.1, rank: 11
            ),
            smellRank: RankModel(
                name: user.muniName, score: 4.4, rank: 2
            ),
            colorRank: RankModel(
                name: user.preName, score: 4.3, rank: 3
            )
        )
    }
    
    var body: some View {
        
        NavigationView{
            List {
                Section("基本情報") {
                    TabView {
                        
                        UserRankView(allRank: self.preRankModel, isPre: true)
                            .onAppear {
                                self.preRankModel = AllRankModel(
                                    name: self.userModel.preName,
                                    allRank: RankModel(
                                        name: self.userModel.preName, score: 4.3, rank: 4
                                    ),
                                    tasteRank: RankModel(
                                        name: self.userModel.preName, score: 4.1, rank: 11
                                    ),
                                    smellRank: RankModel(
                                        name: self.userModel.preName, score: 4.4, rank: 2
                                    ),
                                    colorRank: RankModel(
                                        name: self.userModel.preName, score: 4.3, rank: 3
                                    )
                                )
                            }
                        
                        UserRankView(allRank: self.muniRankModel, isPre: false)
                            .onAppear {
                                self.muniRankModel = AllRankModel(
                                    name: self.userModel.muniName,
                                    allRank: RankModel(
                                        name: self.userModel.muniName, score: 4.3, rank: 4
                                    ),
                                    tasteRank: RankModel(
                                        name: self.userModel.muniName, score: 4.1, rank: 11
                                    ),
                                    smellRank: RankModel(
                                        name: self.userModel.muniName, score: 4.4, rank: 2
                                    ),
                                    colorRank: RankModel(
                                        name: self.userModel.preName, score: 4.3, rank: 3
                                    )
                                )
                            }
                        
                        VStack {
                            Best3View(
                                title: "ベスト3 都道府県",
                                rank1Model: RankModel(name: "東京都", score: 4.87, rank: 1),
                                rank2Model: RankModel(name: "東京都", score: 4.87, rank: 1),
                                rank3Model: RankModel(name: "東京都", score: 4.87, rank: 1)
                            )
                            
                            Best3View(
                                title: "ベスト3 都道府県",
                                rank1Model: RankModel(name: "東京都", score: 4.87, rank: 1),
                                rank2Model: RankModel(name: "東京都", score: 4.87, rank: 1),
                                rank3Model: RankModel(name: "東京都", score: 4.87, rank: 1)
                            )
                        }
                        
                        
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .frame(height: 270)
                    .onAppear {
                        if let user = fetchUser() {
                            self.userModel = user
                        } else {
                            self.userModel = UserModel(
                                userName: "", preId: 1, preName: "", muniId: 1, muniName: ""
                            )
                        }
                    }
                    
                }
                
                Section("ランキング") {
                    TabView {
                        Best3View(
                            title: "ベスト3 都道府県",
                            rank1Model: RankModel(name: "東京都", score: 4.87, rank: 1),
                            rank2Model: RankModel(name: "東京都", score: 4.87, rank: 1),
                            rank3Model: RankModel(name: "東京都", score: 4.87, rank: 1)
                        )
                        
                        Best3View(
                            title: "ワースト3 都道府県",
                            rank1Model: RankModel(name: "東京都", score: 4.87, rank: 1),
                            rank2Model: RankModel(name: "東京都", score: 4.87, rank: 1),
                            rank3Model: RankModel(name: "東京都", score: 4.87, rank: 1)
                        )
                        
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .frame(height: 135)
                    
                    TabView {
                        Best3View(
                            title: "ベスト3 市区",
                            rank1Model: RankModel(name: "東京都", score: 4.87, rank: 1),
                            rank2Model: RankModel(name: "東京都", score: 4.87, rank: 1),
                            rank3Model: RankModel(name: "東京都", score: 4.87, rank: 1)
                        )
                        
                        Best3View(
                            title: "ワースト3 市区",
                            rank1Model: RankModel(name: "東京都", score: 4.87, rank: 1),
                            rank2Model: RankModel(name: "東京都", score: 4.87, rank: 1),
                            rank3Model: RankModel(name: "東京都", score: 4.87, rank: 1)
                        )
                        
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .frame(height: 135)
                    
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
