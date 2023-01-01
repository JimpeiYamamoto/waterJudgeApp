//
//  VoteView.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2022/12/29.
//

import SwiftUI

struct VoteView: View {
    
    private var user: UserModel
    @State var isDoneVote: Bool = false
    
    init() {
        // TODO: UserDefaultから読み込む
        self.user = UserModel(
            userName: "hogeuser", prefectures: "神奈川県", municipalities: "川崎市"
        )
    }
    
    var body: some View {
        NavigationView{
            VStack {
                HStack {
                    Text("居住地:")
                    Text("\(user.prefectures) \(user.municipalities)")
                }
                .padding()
                
                if isDoneVote {
                    WaitView()
                } else {
                    YetVoteView(isDoneVote: $isDoneVote)
                }

            }
            .navigationTitle("2022-12/29")
            .navigationBarItems(trailing:Button(action: {}, label: {
                NavigationLink(destination: EditUserInfoView()) {
                    Image(systemName: "person.circle.fill")
                }
            }))
        }
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

struct YetVoteView: View {
    
    @State var inputComment: String = ""
    @Binding var isDoneVote: Bool
    
    var body: some View {
        Text("本日の投票")
        VoteSliderView(title: "味")
        VoteSliderView(title: "透明度")
        VoteSliderView(title: "におい")
        HStack {
            Text("総合")
            Text("2.56")
        }
        
        Text("コメント")
        TextEditor(text: $inputComment)
            .colorMultiply(.gray.opacity(0.5))
            .frame(width: 200)
            .frame(height: 200)
        
        Button {
            //isDoneVote.toggle()
        } label: {
            Text("送信")
        }
    }
}


struct VoteSliderView: View {
    
    var title: String
    @State var value: Double = 0
    
    var body: some View {
        HStack {
            Text(title)
            Slider(
                value: $value,
                in: 1...5,
                step: 1.0,
                minimumValueLabel: Text("1"),
                maximumValueLabel: Text("5"),
                label: {EmptyView()}
            )
            Text("\(Int(value))")
        }
    }
}

struct VoteView_Previews: PreviewProvider {
    static var previews: some View {
        VoteView()
    }
}
