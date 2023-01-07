//
//  RankCellView.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2022/12/30.
//

import SwiftUI

struct RankCellView: View {
    
    let rankModel: RankModel
    
    var body: some View {
        HStack {
            Text("\(rankModel.rank).")
                .foregroundColor(.white)
            Text("\(rankModel.name)")
                .foregroundColor(.white)
            Spacer()
            Text("\(String(round(rankModel.score * 100) / 100))")
                .foregroundColor(.white)
            Button {
            } label: {
                NavigationLink(
                    // TODO: メッセージボタンを押した後の挙動は未定義
                    //destination: CommentListView(rankModel: rankModel),
                    destination: EmptyView(),
                    label: {
                        Image(systemName: "ellipsis.message.fill")
                    })
            }
        }
    }
}

struct RankCellView_Previews: PreviewProvider {
    static var previews: some View {
        RankCellView(rankModel: RankModel(name: "和歌山県", score: 3.3, rank: 22))
    }
}
