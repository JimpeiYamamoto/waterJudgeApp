//
//  RankCellView.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2022/12/30.
//

import SwiftUI

struct RankCellView: View {
    
    var rankModel: RankCellModel
    
    var body: some View {
        HStack {
            Text("\(rankModel.rank)")
            Text("\(rankModel.name)")
            Text("\(rankModel.score)")
            Button {
            } label: {
                NavigationLink(
                    destination: CommentListView(rankModel: rankModel),
                    label: {
                        Image(systemName: "ellipsis.message.fill")
                    })
            }
        }
    }
}

struct RankCellView_Previews: PreviewProvider {
    static var previews: some View {
        RankCellView(
            rankModel: RankCellModel(rank: 1, name: "川崎市", score: 4.4)
        )
    }
}
