//
//  TimelineView.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2023/01/06.
//

import SwiftUI

struct TimelineView: View {
    
    @State var comments: [CommentCellModel] = []
    
    var body: some View {
        
        NavigationView{
            List {
                ForEach(comments, id: \.user.userName) { comment in
                    Text(comment.comment)
                }
            }
            .refreshable {
                self.comments.append(
                    CommentCellModel(
                        user: UserModel(
                            userName: "hello", preId: 1, preName: "pre", muniId: 1, muniName: "muni"
                        ),
                        comment: "good water for me",
                        score: ScoreModel(taste: 1.0, smell: 2.0, color: 3.0),
                        time: "2022-10/4-23:09")
                )
            }
            .listStyle(.plain)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("water judge")
            .navigationBarItems(leading:Button(action: {
            }, label: {
                NavigationLink {EditUserInfoView()} label: {Image(systemName: "person.circle.fill")}
            }))
            .onAppear{
                self.comments.append(
                    CommentCellModel(
                        user: UserModel(
                            userName: "user1", preId: 1, preName: "pre", muniId: 1, muniName: "muni"
                        ),
                        comment: "good water for me",
                        score: ScoreModel(taste: 1.0, smell: 2.0, color: 3.0),
                        time: "2022-10/4-23:09")
                )
                
                self.comments.append(
                    CommentCellModel(
                        user: UserModel(
                            userName: "user1", preId: 1, preName: "pre", muniId: 1, muniName: "muni"
                        ),
                        comment: "good water for me",
                        score: ScoreModel(taste: 1.0, smell: 2.0, color: 3.0),
                        time: "2022-10/4-23:09")
                )
            }
        }
        
    }
}

struct TimelineView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineView()
    }
}
