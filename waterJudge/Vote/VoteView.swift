//
//  VoteView.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2022/12/29.
//

import SwiftUI

struct VoteView: View {
    
    @State private var user: UserModel?
    @FocusState var focus:Bool
    @State var inputComment = ""
    
    init() {
        if let fetchUser = fetchUser() {
            self.user = fetchUser
        } else {
            self.user = UserModel(
                userName: "", preId: 1, preName: "", muniId: 1, muniName: ""
            )
        }
    }
    
    var body: some View {
        NavigationView{
            List {
                Text((self.user?.muniName == nil ? "未設定": self.user?.muniName)!)
                    .font(.headline)
                VoteSliderView(title: "味", maxLabel: "有", minLabel: "無")
                VoteSliderView(title: "におい", maxLabel: "有", minLabel: "無")
                VoteSliderView(title: "色", maxLabel: "有", minLabel: "無")
                
                Section("コメント") {
                    TextEditor(text: $inputComment)
                        .frame(height: UIScreen.main.bounds.height / 8)
                        .focused(self.$focus)
                }
            }
            .listStyle(.plain)
            .navigationTitle("2022-12/29")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:Button(action: {
                self.focus = false
            }, label: {
                Text("投票")
            }))
            .onAppear {
                if let fetchUser = fetchUser() {
                    self.user = fetchUser
                } else {
                    self.user = UserModel(
                        userName: "", preId: 1, preName: "", muniId: 1, muniName: ""
                    )
                }
            }
        }
    }
    
    func fetchUser() -> UserModel? {
        let key = "user"
        guard
            let data = UserDefaults.standard.data(forKey: key),
            let savedUser = try? JSONDecoder().decode(UserModel.self, from: data)
        else { return nil }
        return savedUser
    }
}

struct WaitView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 200)
                .frame(height: 200)
                .foregroundColor(.blue)
            VStack {
                Text("本日の投票は完了しています。")
                Text("次の投票可能時刻まで 5:23:32")
            }
        }
    }
}

struct VoteView_Previews: PreviewProvider {
    static var previews: some View {
        VoteView()
    }
}
