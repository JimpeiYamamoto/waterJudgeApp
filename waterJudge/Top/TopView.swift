//
//  TopView.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2022/12/29.
//

import SwiftUI

struct TopView: View {
    
    @State var userModel: UserModel
    @State var preRankModel: AllRankModel
    @State var muniRankModel: AllRankModel
    
    @State var preRankings: [AllRankModel]
    @State var muniRankings: [AllRankModel]
    
    @State var date: String = ""
    
    init() {
        // TODO: Fetch from DB
        self.preRankings = [
            AllRankModel(
                name: "富山県",
                allRank: RankModel(name: "富山県", score: 4.99, rank: 1),
                tasteRank: RankModel(name: "富山県", score: 4.88, rank: 1),
                smellRank: RankModel(name: "富山県", score: 4.76, rank: 1),
                colorRank: RankModel(name: "富山県", score: 4.80, rank: 1)
            ),
            AllRankModel(
                name: "山梨県",
                allRank: RankModel(name: "山梨県", score: 4.99, rank: 2),
                tasteRank: RankModel(name: "山梨県", score: 4.88, rank: 2),
                smellRank: RankModel(name: "山梨県", score: 4.76, rank: 2),
                colorRank: RankModel(name: "山梨県", score: 4.80, rank: 2)
            ),
            AllRankModel(
                name: "青森県",
                allRank: RankModel(name: "青森県", score: 4.99, rank: 3),
                tasteRank: RankModel(name: "青森県", score: 4.88, rank: 3),
                smellRank: RankModel(name: "青森県", score: 4.76, rank: 3),
                colorRank: RankModel(name: "青森県", score: 4.80, rank: 3)
            )
            
        ]
        self.muniRankings = [
            AllRankModel(
                name: "富山県富士市",
                allRank: RankModel(name: "富山県富士市", score: 4.99, rank: 1),
                tasteRank: RankModel(name: "富山県富士市", score: 4.88, rank: 1),
                smellRank: RankModel(name: "富山県富士市", score: 4.76, rank: 1),
                colorRank: RankModel(name: "富山県富士市", score: 4.80, rank: 1)
            ),
            AllRankModel(
                name: "山梨県甲府市",
                allRank: RankModel(name: "山梨県甲府市", score: 4.99, rank: 2),
                tasteRank: RankModel(name: "山梨県甲府市", score: 4.88, rank: 2),
                smellRank: RankModel(name: "山梨県甲府市", score: 4.76, rank: 2),
                colorRank: RankModel(name: "山梨県甲府市", score: 4.80, rank: 2)
            ),
            AllRankModel(
                name: "青森県盛岡市",
                allRank: RankModel(name: "青森県盛岡市", score: 4.99, rank: 3),
                tasteRank: RankModel(name: "青森県盛岡市", score: 4.88, rank: 3),
                smellRank: RankModel(name: "青森県盛岡市", score: 4.76, rank: 3),
                colorRank: RankModel(name: "青森県盛岡市", score: 4.80, rank: 3)
            )
        ]
        
        // TODO: Fix force unwrap
        let user = fetchUser() ?? UserModel(
            userName: "user1", preId: 1, preName: "pre", muniId: 1, muniName: "mun"
        )
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
                name: user.muniName, score: 4.3, rank: 120
            ),
            tasteRank: RankModel(
                name: user.muniName, score: 4.1, rank: 110
            ),
            smellRank: RankModel(
                name: user.muniName, score: 4.4, rank: 273
            ),
            colorRank: RankModel(
                name: user.preName, score: 4.3, rank: 329
            )
        )
    }
    
    var body: some View {
        
        NavigationView{
            List {

                Section("あなたの居住地") {
                    TabView {
                        RankCellView(
                            showRank: self.preRankModel.allRank.rank,
                            allRank: self.preRankModel
                        )
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

                        RankCellView(
                            showRank: self.muniRankModel.allRank.rank,
                            allRank: self.muniRankModel
                        )
                        .onAppear {
                            self.muniRankModel = AllRankModel(
                                name: self.userModel.muniName,
                                allRank: RankModel(
                                    name: self.userModel.muniName, score: 4.3, rank: 1293
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
                    }
                    .frame(height: 180)
                    .tabViewStyle(PageTabViewStyle())
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
                
                Section {
                    ForEach(preRankings, id: \.name) { ranking in
                        RankCellView(
                            showRank: ranking.allRank.rank,
                            allRank: ranking
                        )
                    }
                } header: {
                    HStack {
                        Text("【総合】都道府県別ランキング")
                        Spacer()
                        Button {
                        
                        } label: {
                            Text("もっと見る")
                                .opacity(0.7)
                        }
                    }
                    
                }
                
                Section {
                    ForEach(muniRankings, id: \.name) { ranking in
                        RankCellView(
                            showRank: ranking.allRank.rank,
                            allRank: ranking
                        )
                    }
                } header: {
                    HStack {
                        Text("【総合】市区町村別ランキング")
                        Spacer()
                        Button {
                        
                        } label: {
                            Text("もっと見る")
                                .opacity(0.7)
                        }
                    }
                }
                
                Section {
                    ForEach(muniRankings, id: \.name) { ranking in
                        RankCellView(
                            showRank: ranking.tasteRank.rank,
                            allRank: ranking
                        )
                    }
                } header: {
                    HStack {
                        Text("【味 部門】都道府県別ランキング")
                        Spacer()
                        Button {
                        
                        } label: {
                            Text("もっと見る")
                                .opacity(0.7)
                        }
                    }
                }
                
                Section {
                    ForEach(preRankings, id: \.name) { ranking in
                        RankCellView(
                            showRank: ranking.smellRank.rank,
                            allRank: ranking
                        )
                    }
                } header: {
                    HStack {
                        Text("【におい 部門】都道府県別ランキング")
                        Spacer()
                        Button {
                        
                        } label: {
                            Text("もっと見る")
                                .opacity(0.7)
                        }
                    }
                }
                
                Section {
                    ForEach(preRankings, id: \.name) { ranking in
                        RankCellView(
                            showRank: ranking.colorRank.rank,
                            allRank: ranking
                        )
                    }
                } header: {
                    HStack {
                        Text("【色 部門】都道府県別ランキング")
                        Spacer()
                        Button {
                        
                        } label: {
                            Text("もっと見る")
                                .opacity(0.7)
                        }
                    }
                }
                
                Section {
                    ForEach(muniRankings, id: \.name) { ranking in
                        RankCellView(
                            showRank: ranking.tasteRank.rank,
                            allRank: ranking
                        )
                    }
                } header: {
                    HStack {
                        Text("【味 部門】市区町村別ランキング")
                        Spacer()
                        Button {
                        
                        } label: {
                            Text("もっと見る")
                                .opacity(0.7)
                        }
                    }
                }
                
                Section {
                    ForEach(muniRankings, id: \.name) { ranking in
                        RankCellView(
                            showRank: ranking.smellRank.rank,
                            allRank: ranking
                        )
                    }
                } header: {
                    HStack {
                        Text("【におい 部門】市区町村別ランキング")
                        Spacer()
                        Button {
                        
                        } label: {
                            Text("もっと見る")
                                .opacity(0.7)
                        }
                    }
                }
                
                Section {
                    ForEach(muniRankings, id: \.name) { ranking in
                        RankCellView(
                            showRank: ranking.colorRank.rank,
                            allRank: ranking
                        )
                    }
                } header: {
                    HStack {
                        Text("【色 部門】市区町村別ランキング")
                        Spacer()
                        Button {
                        
                        } label: {
                            Text("もっと見る")
                                .opacity(0.7)
                        }
                    }
                }
                
            }
            .onAppear {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = DateFormatter.dateFormat(
                    fromTemplate:"yyyyMMdd",
                    options: 0,
                    locale: Locale(identifier: "ja_JP")
                )
                self.date = dateFormatter.string(from: Date())
            }
            .listStyle(.plain)
            .navigationTitle(self.date)
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
        TopView()
    }
}
