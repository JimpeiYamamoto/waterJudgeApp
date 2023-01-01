//
//  RankCellView.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2022/12/30.
//

import SwiftUI

struct RankCellView: View {
    
    let rankModel: RankCellModel
    
    init(rankModel: RankCellModel) {
        self.rankModel = rankModel
    }
    
    var body: some View {
        HStack {
            Text("\(rankModel.rank).")
                .font(.title2)
                .foregroundColor(.white)
            Text("\(rankModel.name)")
                .foregroundColor(.white)
                .font(.title2)
            Spacer()
            Text("\(String(round(rankModel.score * 100) / 100))")
                .foregroundColor(.white)
                .font(.title2)
            Button {
            } label: {
                NavigationLink(
                    destination: CommentListView(rankModel: rankModel),
                    label: {
                        Image(systemName: "ellipsis.message.fill")
                    })
            }
        }
        .padding()
        .background(
            Rectangle()
                .cornerRadius(20)
                .foregroundColor(.mint)
        )
    }
}

struct RankCellView_Previews: PreviewProvider {
    static var previews: some View {
        RankCellView(
            rankModel: RankCellModel(rank: 1, name: "川崎市", score: 4.4)
        )
    }
}
