//
//  TopView.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2022/12/29.
//

import SwiftUI

struct TopView: View {
    
    @State var userModel: UserModel
    @State var rankModel: RankCellModel
    @State var comments: [CommentCellModel]
    
    init() {
        self.userModel = fetchUser()!
        self.rankModel = RankCellModel(rank: 1, name: "hoge", score: 3.8)
        self.comments = [CommentCellModel(userName: "hoge", comment: "hogehoge", score: 3.22)]
    }
    
    var body: some View {
        
        NavigationView{
            ScrollView {
                
                UserAreaInfoView(
                    userModel: userModel,
                    rankModel: rankModel,
                    comments: comments
                )
                
                Best3View(
                    title: "神奈川県内ランキング",
                    rank1Model: RankCellModel(rank: 1, name: "川崎市", score: 4.75),
                    rank2Model: RankCellModel(rank: 2, name: "横浜市", score: 4.43),
                    rank3Model: RankCellModel(rank: 3, name: "相模原市", score: 2.32)
                )
                Best3View(
                    title: "都道府県別ランキング",
                    rank1Model: RankCellModel(rank: 1, name: "東京都", score: 4.75),
                    rank2Model: RankCellModel(rank: 2, name: "神奈川県", score: 4.43),
                    rank3Model: RankCellModel(rank: 3, name: "大阪府", score: 2.32)
                )
                Best3View(
                    title: "全国市区町村ランキング",
                    rank1Model: RankCellModel(rank: 1, name: "川崎市", score: 4.75),
                    rank2Model: RankCellModel(rank: 2, name: "八王子市", score: 4.43),
                    rank3Model: RankCellModel(rank: 3, name: "文京区", score: 2.32)
                )
                
            }
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
        TopView()
    }
}
