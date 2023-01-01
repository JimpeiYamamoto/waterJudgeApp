//
//  Best3View.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2023/01/01.
//

import SwiftUI

struct Best3View: View {
    
    var title: String
    var rank1Model: RankCellModel
    var rank2Model: RankCellModel
    var rank3Model: RankCellModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .underline()
                .foregroundColor(.white)
                .padding()
            RankCellView(rankModel: rank1Model)
                .padding()
            RankCellView(rankModel: rank2Model)
                .padding()
            RankCellView(rankModel: rank3Model)
                .padding()
        }
        .padding()
        .background(
            Rectangle()
                .foregroundColor(.brown)
                .cornerRadius(20)
                .frame(maxWidth: UIScreen.main.bounds.width / 20 * 19)
        )
    }
}

struct Best3View_Previews: PreviewProvider {
    static var previews: some View {
        Best3View(
            title: "タイトル",
            rank1Model: RankCellModel(rank: 1, name: "東京", score: 4.3),
            rank2Model: RankCellModel(rank: 2, name: "神奈川", score: 3.8),
            rank3Model: RankCellModel(rank: 3, name: "和歌山", score: 3.3)
        )
    }
}
