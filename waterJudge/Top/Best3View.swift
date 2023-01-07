//
//  Best3View.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2023/01/01.
//

import SwiftUI

struct Best3View: View {
    
    var title: String
    var rank1Model: RankModel
    var rank2Model: RankModel
    var rank3Model: RankModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .underline()
                .foregroundColor(.white)
                .padding()
            RankCellView(rankModel: rank1Model)
            RankCellView(rankModel: rank2Model)
            RankCellView(rankModel: rank3Model)
                .padding(.bottom)
        }
        .frame(height: 95)
        .padding()
        .background(
            Rectangle()
                .foregroundColor(.brown)
                .cornerRadius(10)
        )
    }
}

struct Best3View_Previews: PreviewProvider {
    static var previews: some View {
        Best3View(
            title: "タイトル",
            rank1Model: RankModel(name: "神奈川県", score: 4.7, rank: 1),
            rank2Model: RankModel(name: "青森県", score: 4.4, rank: 3),
            rank3Model: RankModel(name: "宮城県", score: 4.2, rank: 3)
        )
    }
}
