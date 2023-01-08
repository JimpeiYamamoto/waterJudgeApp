//
//  TimelineView.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2023/01/06.
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
                Spacer()
                Text("\(comment.time)")
                    .opacity(0.5)
            }
            .padding(.top, 10)
            
            Text(comment.comment)
                .padding(.vertical, 5)
            HStack {
                
                Text("総合:\(String(round(comment.score.all * 10) / 10))")
                    .opacity(0.7)
                Text("(味:\(Int(comment.score.taste)), におい:\(Int(comment.score.smell)),色:\(Int(comment.score.color)))")
                    .opacity(0.7)
            }
            .padding(.bottom, 5)
        }
    }
    
}

struct TimelineView: View {
    
    @State var comments: [VoteModel] = []
    
    var body: some View {
        
        NavigationView{
            List {
                ForEach(comments, id: \.voteId) { comment in
                    // TODO: １つの投稿を表示する
                    TimelineCellView(comment: comment)
                }
            }
            .refreshable {
                // TODO: DBからフェッチする
                self.comments.append(
                    VoteModel(
                        voteId: Int.random(in: 5..<100000),
                        user: UserModel(
                            userId: 1,
                            userName: "hello",
                            preId: 1,
                            preName: "pre",
                            muniId: 1,
                            muniName: "muni"
                        ),
                        comment: "good water for me",
                        score: ScoreModel(taste: 2.0, smell: 2.0, color: 3.0),
                        time: "2022-10/4-23:09")
                )
            }
            .listStyle(.plain)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading:Button(action: {
            }, label: {
                NavigationLink {EditUserInfoView()} label: {Image(systemName: "person.circle.fill")}
            }))
            .onAppear{
                // TODO: DBからフェッチする
                self.comments = [
                    VoteModel(
                        voteId: 1,
                        user: UserModel(
                            userId: 1,
                            userName: "user1",
                            preId: 1,
                            preName: "pre",
                            muniId: 1,
                            muniName: "東京都 北区"
                        ),
                        comment: "hoeghogehohgeo good water for me",
                        score: ScoreModel(taste: 1.0, smell: 2.0, color: 3.0),
                        time: "2022-10/4-23:09"
                    )
                    ,
                    VoteModel(
                        voteId: 2,
                        user: UserModel(
                            userId: 2,
                            userName: "user2",
                            preId: 1,
                            preName: "pre",
                            muniId: 1,
                            muniName: "muni"
                        ),
                        comment: "good water for me hogehogehogheoheohgeohoehgoehgoehgoehgeohoehgoehoehoegoeheohgeoh",
                        score: ScoreModel(taste: 1.0, smell: 2.0, color: 3.0),
                        time: "2022-10/4-23:09"
                    )
                ]
                
                
            }
        }
        
    }
}

struct TimelineView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineView()
    }
}
