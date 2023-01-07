//
//  SwiftUIView.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2023/01/07.
//

import SwiftUI

struct UserRankView: View {
    
    let allRank: AllRankModel
    let isPre: Bool
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(allRank.name)
                .font(.title3)
                .underline()
                .padding()
            
            VStack() {
                HStack(alignment: .bottom) {
                    Spacer()
                    Text("\(String(round(allRank.allRank.score*100)/100)) / 5.0 点")
                        .font(.title)
                    Spacer()
                }
                HStack(alignment: .bottom) {
                    Spacer()
                    Text("\(allRank.allRank.rank) / \(isPre ? 47: 1120) 位")
                        .font(.title2)
                    Spacer()
                }
                .padding(.bottom)
            }
            
            HStack {
                smallRankView(
                    title: "味",
                    score: allRank.tasteRank.score,
                    rank: allRank.tasteRank.rank,
                    isPre: isPre
                )
                
                smallRankView(
                    title: "臭",
                    score: allRank.smellRank.score,
                    rank: allRank.smellRank.rank,
                    isPre: isPre
                )
                
                smallRankView(
                    title: "色",
                    score: allRank.colorRank.score,
                    rank: allRank.colorRank.rank,
                    isPre: isPre
                )
            }
            .padding(.bottom)
            .padding(.horizontal)
        }
        .frame(height: 260)
        .background(
            Rectangle()
                .foregroundColor(.orange)
                .cornerRadius(10)
        )
        
    }
    
}

struct smallRankView: View {
    
    let title: String
    let score: String
    let rank: Int
    let isPre: Bool
    
    init(title: String, score: Double, rank: Int, isPre: Bool) {
        self.title = title
        self.score = String(round(score*100)/100)
        self.rank = rank
        self.isPre = isPre
    }
    
    var body: some View {
        HStack(alignment: .top) {
            Text(title)
                .underline()
                .padding(.leading, 5)
            Spacer()
            VStack(alignment: .leading) {
                Text("\(score) 点")
                    .font(.headline)
                Text("\(rank) 位")
            }
            .padding(.trailing)
        }
        .padding(.vertical, 5)
        //.frame(width: UIScreen.main.bounds.width / 7 * 2)
        .background(
            Rectangle()
                .foregroundColor(.mint)
                .cornerRadius(10)
        )
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        UserRankView(
            allRank: AllRankModel(
                name: "東京度",
                allRank: RankModel(
                    name: "東京都", score: 4.3, rank: 4
                ),
                tasteRank: RankModel(
                    name: "東京都", score: 4.1, rank: 11
                ),
                smellRank: RankModel(
                    name: "東京都", score: 4.4, rank: 2
                ),
                colorRank: RankModel(
                    name: "東京都", score: 4.3, rank: 3
                )
            ),
            isPre: true
        )
    }
}
