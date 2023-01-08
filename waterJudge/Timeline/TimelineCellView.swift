//
//  TimelineCellView.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2023/01/08.
//

import SwiftUI

struct TimelineCellView: View {
    
    let comment: VoteModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Image(systemName: "person.circle.fill")
                Text(comment.user.userName)
                    .font(.headline)
                    .underline()
                Text("(\(comment.user.muniName))")
                    .font(.callout)
                Spacer()
                Text("\(comment.time)")
                    .opacity(0.5)
                    .font(.callout)
            }
            .padding(.top, 10)
            
            Text(comment.comment)
                .font(.callout)
                .padding(.vertical, 5)
            HStack {
                
                Text("総合:\(String(round(comment.score.all * 10) / 10))")
                    .opacity(0.7)
                    .font(.callout)
                Text("(味:\(Int(comment.score.taste)), におい:\(Int(comment.score.smell)),色:\(Int(comment.score.color)))")
                    .opacity(0.7)
                    .font(.callout)
            }
            .padding(.bottom, 5)
        }
    }
    
}

struct TimelineCellView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineCellView(comment: VoteModel(
            voteId: 1,
            user: UserModel(
                userId: 1,
                userName: "hoge",
                preId: 1,
                preName: "pre",
                muniId: 1,
                muniName: "muni"
            ),
            comment: "hello",
            score: ScoreModel(taste: 1.0, smell: 2.0, color: 4.0),
            time: "2022/10/4-12:30")
        )
    }
}
