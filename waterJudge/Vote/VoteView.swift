//
//  VoteView.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2022/12/29.
//

import SwiftUI

struct VoteView: View {
    
    @State var userModel: UserModel?
    @State var voteModel: VoteModel?
    
    @FocusState var focus:Bool
    @State var inputComment:String = ""
    @State var tasteScore:Double = 1.0
    @State var smellScore:Double = 1.0
    @State var colorScore:Double = 1.0
    @State var date: String = ""
    @State var isDone: Bool = false
    
    init() {
        let user = fetchUser() ?? UserModel(
            userName: "user1", preId: 1, preName: "pre", muniId: 1, muniName: "mun"
        )
        self.userModel = user
        
        let vote = fetchVote() ?? VoteModel(
            user: user,
            comment: "",
            score: ScoreModel(taste: 1.0, smell: 1.0, color: 1.0),
            time: ""
        )
    }
    
    var body: some View {
        NavigationView{
            List {
                Text((self.userModel?.muniName == nil ? "未設定": self.userModel?.muniName)!)
                    .font(.headline)
                VoteSliderView(title: "味", maxLabel: "有", minLabel: "無", value: $tasteScore)
                VoteSliderView(title: "におい", maxLabel: "有", minLabel: "無", value: $smellScore)
                VoteSliderView(title: "色", maxLabel: "有", minLabel: "無", value: $colorScore)
                
                Section("コメント") {
                    TextEditor(text: $inputComment)
                        .frame(height: UIScreen.main.bounds.height / 8)
                        .focused(self.$focus)
                }
                Text("※ 投票は1日1回有効ですが、何度でも変更可能です")
                    .font(.caption)
            }
            .listStyle(.plain)
            .navigationTitle(self.date)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:Button(action: {
                self.focus = false
                self.isDone = true
                saveVote(vote: VoteModel(
                    user: self.userModel ?? UserModel(
                        userName: "", preId: 1, preName: "", muniId: 1, muniName: ""
                    ),
                    comment: inputComment,
                    score: ScoreModel(taste: tasteScore, smell: smellScore, color: colorScore),
                    time: self.date)
                )
            }, label: {
                Text(isDone ? "変更": "投票")
            }))
            .onAppear {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = DateFormatter.dateFormat(
                    fromTemplate:"yyyyMMdd",
                    options: 0,
                    locale: Locale(identifier: "ja_JP")
                )
                self.date = dateFormatter.string(from: Date())
                
                // UserDefaultからユーザーの情報をフェッチする
                let user = fetchUser() ?? UserModel(
                    userName: "user1", preId: 1, preName: "pre", muniId: 1, muniName: "mun"
                )
                self.userModel = user
                // 既に投票が終わっているのか、終わっているならその状態を表示する
                let vote = fetchVote() ?? VoteModel(
                    user: user,
                    comment: "",
                    score: ScoreModel(taste: 1.0, smell: 1.0, color: 1.0),
                    time: ""
                )
                self.voteModel = vote
                if vote.time == self.date {
                    isDone = true
                } else {
                    isDone = false
                }
                self.voteModel = vote
                self.tasteScore = vote.score.taste
                self.smellScore = vote.score.smell
                self.colorScore = vote.score.color
                self.inputComment = vote.comment
            }
            .onTapGesture {
                self.focus = false
            }
        }
    }
    
}

struct VoteView_Previews: PreviewProvider {
    static var previews: some View {
        VoteView()
    }
}
