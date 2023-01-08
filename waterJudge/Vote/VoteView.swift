//
//  VoteView.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2022/12/29.
//

import SwiftUI

struct VoteView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var      userModel:      UserModel = UserModel(
        userId: 1, userName: "", preId: 0, preName: "", muniId: 0, muniName: ""
    )
    @State var      voteModel:      VoteModel = VoteModel(
        voteId: 1,
        user: UserModel(userId: 1, userName: "", preId: 0, preName: "", muniId: 0, muniName: ""),
        comment: "",
        score: ScoreModel(taste: 0.0, smell: 0.0, color: 0.0),
        time: ""
    )
    
    @State var      inputComment:   String = ""
    @State var      tasteScore:     Double = 1.0
    @State var      smellScore:     Double = 1.0
    @State var      colorScore:     Double = 1.0
    @State var      date:           String = ""
    
    @State var      isDone:         Bool = false
    @State var      isAlertShow:         Bool = false
    @FocusState var focus:          Bool
    
    var body: some View {
        NavigationView {
            List {
                Text(self.userModel.muniName)
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
            .alert(isPresented: $isAlertShow) {
                Alert(
                    title: Text(isDone ? "本日の投票を変更しますか？": "本日の投票をしますか?"),
                    primaryButton: .default(Text("はい"), action: {
                        self.isDone = true
                        saveVote(
                            vote: VoteModel(
                                voteId: self.voteModel.voteId,
                                user: self.userModel,
                                comment: inputComment,
                                score: ScoreModel(taste: tasteScore, smell: smellScore, color: colorScore),
                                time: self.date
                            )
                        )
                        presentationMode.wrappedValue.dismiss()
                    }),
                    secondaryButton: .default(Text("キャンセル"), action: {})
                )
            }
            .navigationTitle(self.date)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:Button(action: {
                
                self.focus = false
                
                isAlertShow.toggle()
                
            }, label: {
                Text(isDone ? "変更": "投票")
            }))
            .navigationBarItems(leading: Button(
                action: {presentationMode.wrappedValue.dismiss()},
                label: {
                    Image(systemName: "chevron.backward")
                }
            ))
            .onAppear {
                self.date = getToday()
                // UserDefaultからユーザーの情報をフェッチする
                setUser()
                // 既に投票が終わっているのか、終わっているならその状態を表示する
                setVote()
                renderComment()
                
                isDone = self.voteModel.time == self.date ? true: false
            }
            .onTapGesture {
                self.focus = false
            }
        }
    }
    
    func setUser() {
        let user = fetchUser() ?? UserModel(
            userId: 1, userName: "user1", preId: 1, preName: "pre", muniId: 1, muniName: "mun"
        )
        self.userModel = user
    }
    
    func setVote() {
        let vote = fetchVote() ?? VoteModel(
            voteId: 1,
            user: self.userModel,
            comment: "",
            score: ScoreModel(taste: 1.0, smell: 1.0, color: 1.0),
            time: ""
        )
        self.voteModel = vote
    }
    
    func renderComment() {
        self.tasteScore = self.voteModel.score.taste
        self.smellScore = self.voteModel.score.smell
        self.colorScore = self.voteModel.score.color
        self.inputComment = self.voteModel.comment
    }
    
    func getToday()-> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatter.dateFormat(
            fromTemplate:"yyyyMMdd",
            options: 0,
            locale: Locale(identifier: "ja_JP")
        )
        return dateFormatter.string(from: Date())
    }
    
}

struct VoteView_Previews: PreviewProvider {
    static var previews: some View {
        VoteView()
    }
}
