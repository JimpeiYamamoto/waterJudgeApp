//
//  RankCellView.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2022/12/30.
//

import SwiftUI

struct RankCellView: View {
    
    let showRank: Int
    let allRank: AllRankModel
    
    var body: some View {
        HStack(alignment:.center) {
            Text("\(showRank) 位")
                .font(.title3)
                .padding()
                .background(
                    Capsule()
                        .stroke()
                )
            
            VStack(alignment: .leading) {
                Text(allRank.name)
                    .font(.headline)
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                Text("総合：\(doubleToString(num: allRank.allRank.score))")
                    .padding(.leading)
                    .padding(.bottom, 2)
                Text(scoreLabel())
                    .font(.callout)
                    .opacity(0.7)
                    .padding(.leading)
                    .padding(.bottom, 5)
            }
        }
    }
    
    func doubleToString(num: Double) -> String {
        return String(round(num * 100)/100)
    }
    
    func scoreLabel() ->String {
        let tasteScore = doubleToString(num: allRank.tasteRank.score)
        let smellScore = doubleToString(num: allRank.smellRank.score)
        let colorScore = doubleToString(num: allRank.colorRank.score)
        return "味:\(tasteScore)  におい:\(smellScore)  色:\(colorScore)"
    }
}

struct RankCellView_Previews: PreviewProvider {
    static var previews: some View {
        RankCellView(showRank: 1,
                     allRank: AllRankModel(
                        name: "東京都",
                        allRank: RankModel(name: "東京都", score: 3.3, rank: 1),
                        tasteRank: RankModel(name: "東京都", score: 2.2, rank: 4),
                        smellRank: RankModel(name: "東京都", score: 4.42, rank: 3),
                        colorRank: RankModel(name: "東京都", score: 5.00, rank: 1)
                     )
        )
    }
}
