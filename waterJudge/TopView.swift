//
//  TopView.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2022/12/29.
//

import SwiftUI

struct TopView: View {
    
    var body: some View {
        
        NavigationView{
            ScrollView {
                
                UserAreaInfoView()
                    .padding()
                
                Best3View(
                    title: "神奈川県内ランキング",
                    rank1Model: RankCellModel(rank: 1, name: "川崎市", score: 4.75),
                    rank2Model: RankCellModel(rank: 2, name: "横浜市", score: 4.43),
                    rank3Model: RankCellModel(rank: 3, name: "相模原市", score: 2.32)
                )
                .padding()
                
                Best3View(
                    title: "都道府県別ランキング",
                    rank1Model: RankCellModel(rank: 1, name: "東京都", score: 4.75),
                    rank2Model: RankCellModel(rank: 2, name: "神奈川県", score: 4.43),
                    rank3Model: RankCellModel(rank: 3, name: "大阪府", score: 2.32)
                )
                .padding()
                
                Best3View(
                    title: "全国市区町村ランキング",
                    rank1Model: RankCellModel(rank: 1, name: "川崎市", score: 4.75),
                    rank2Model: RankCellModel(rank: 2, name: "八王子市", score: 4.43),
                    rank3Model: RankCellModel(rank: 3, name: "文京区", score: 2.32)
                )
                .padding()
                
                
            }
            .navigationTitle("2022-12/29")
            .navigationBarItems(trailing:Button(action: {
            }, label: {
                Image(systemName: "person.circle.fill")
            }))
        }
    }
}

struct UserAreaInfoView: View {
    
    var body: some View {
        VStack {
            Text("神奈川県")
            Text("スコア: 3.87")
            Text("18 / 47 位")
            Text("最新のコメント")
            HStack {
                Image(systemName: "person")
                Text("変な臭いもせずとても気分がよかったです")
                Text("4.7")
            }
            HStack {
                Image(systemName: "person")
                Text("超美味しい！")
                Text("5.0")
            }
            HStack {
                Image(systemName: "person")
                Text("とてもじゃないが人間が飲むもんじゃないね")
                Text("1.0")
            }
            
        }
    }
}

struct RankCellModel {
    let rank: Int
    let name: String
    let score: Double
}

struct Best3View: View {
    
    var title: String
    var rank1Model: RankCellModel
    var rank2Model: RankCellModel
    var rank3Model: RankCellModel
    
    var body: some View {
        VStack {
            Text(title)
            
            HStack {
                Text("\(rank1Model.rank)")
                Text("\(rank1Model.name)")
                Text("\(rank1Model.score)")
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis.message.fill")
                }
            }
            HStack {
                Text("\(rank2Model.rank)")
                Text("\(rank2Model.name)")
                Text("\(rank2Model.score)")
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis.message.fill")
                }
            }
            HStack {
                Text("\(rank3Model.rank)")
                Text("\(rank3Model.name)")
                Text("\(rank3Model.score)")
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis.message.fill")
                }
            }
            

        }
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
