//
//  TimelineView.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2023/01/06.
//

import SwiftUI

struct TimelineView: View {
    
    @State var comments: [VoteModel] = []
    
    @State var isShowVoteView: Bool = false
    @State var isShowEditUserView: Bool = false
    
    var body: some View {
        
        NavigationView{
            ZStack {
                List {
                    ForEach(comments, id: \.voteId) { comment in
                        // TODO: １つの投稿を表示する
                        TimelineCellView(comment: comment)
                    }
                }
                .refreshable {
                    // TODO: DBからフェッチする
                    refreshComments()
                }
                .listStyle(.plain)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading:Button(action: {
                    isShowEditUserView.toggle()
                }, label: {
                    Image(systemName: "person.circle.fill")
                }))
                .onAppear{
                    // TODO: DBからフェッチする
                    fetchComments()
                }
                .sheet(isPresented: $isShowEditUserView, content: {EditUserInfoView()})
                
                VoteButtonView(isShow: $isShowVoteView)
                    .sheet(isPresented: $isShowVoteView, content: {VoteView()})
            }
            
        }
    }
    
    func fetchComments() {
        self.comments = [
            VoteModel(
                voteId: 1,
                user: UserModel(
                    userId: 1,
                    userName: "太郎",
                    preId: 1,
                    preName: "東京都",
                    muniId: 1,
                    muniName: "東京都港区"
                ),
                comment: "においもなく、とてもすっきりとした味わいです。美味しかった",
                score: ScoreModel(taste: 4.0, smell: 5.0, color: 4.0),
                time: "2023-1/4-23:09"
            )
            ,
            VoteModel(
                voteId: 2,
                user: UserModel(
                    userId: 2,
                    userName: "花子",
                    preId: 1,
                    preName: "神奈川県",
                    muniId: 1,
                    muniName: "神奈川県川崎市"
                ),
                comment: "ちょっと塩素臭が気になりました。しっかりと消毒されていることが確認できるので安心できます。透明感もあるので悪くありません。",
                score: ScoreModel(taste: 3.0, smell: 2.0, color: 5.0),
                time: "2023-1/3-10:31"
            )
        ]
    }
    
    func refreshComments() {
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
}

struct VoteButtonView: View{
    
    @Binding var isShow: Bool
    
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .trailing) {
                Spacer()
                Button {
                    isShow.toggle()
                } label: {
                    Image(systemName: "plus")
                        .padding()
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .background(
                            Capsule()
                                .foregroundColor(.indigo)
                        )
                }
                .padding()
            }
        }
        .padding()
    }
}

struct TimelineView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineView()
    }
}
