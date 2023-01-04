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
    @State var score:Double = 1.0
    
    init() {
        // TODO: UserDefaultから読み込む
        self.user = UserModel(
            userName: "hogeuser", prefectures: "神奈川県", municipalities: "川崎市"
        )
    }
    
    var body: some View {
        NavigationView{
            ScrollView {
                HStack {
                    Text("居住地: ")
                        .font(.title2)
                        .frame(alignment: .leading)
                    
                    Text("\(user.prefectures) \(user.municipalities)")
                        .underline()
                        .font(.title2)
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                
                if isDoneVote {
                    WaitView()
                } else {
                    YetVoteView(isDoneVote: $isDoneVote, score: $score)
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
    @Binding var score: Double
    
    var body: some View {
        VStack {
            Text("本日の投票")
                .font(.title2)
                .underline()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .padding(.top)
            VoteSliderView(title: "味", maxLabel: "無", minLabel: "有")
                .padding(.leading)
                .padding(.trailing)
            VoteSliderView(title: "におい", maxLabel: "無", minLabel: "有")
                .padding(.leading)
                .padding(.trailing)
            VoteSliderView(title: "色", maxLabel: "無", minLabel: "有")
                .padding(.leading)
                .padding(.trailing)
            
            Text("スコア: \(String(score))")
                .font(.title2)
                .underline()
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing)
                .padding(.bottom)
        }
        .background(
            Rectangle()
                .foregroundColor(.mint)
                .cornerRadius(10)
        )
        .padding(.leading)
        .padding(.trailing)
        
        Text("コメント")
            .font(.title2)
            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
            .padding(.leading)
            .underline()
        
        TextEditor(text: $inputComment)
            .colorMultiply(.gray.opacity(0.5))
            .frame(width: UIScreen.main.bounds.width / 20 * 19)
            .frame(height: UIScreen.main.bounds.height / 8)
        
        Button {
            //isDoneVote.toggle()
            UIApplication.shared.sendAction(
                #selector(UIResponder.resignFirstResponder),
                to: nil,
                from: nil,
                for: nil
            )
        } label: {
            Text("送信")
                .bold()
                .foregroundColor(.gray)
                .padding()
                .padding(.horizontal, UIScreen.main.bounds.width / 3)
                .background(
                    Capsule()
                        .stroke(Color.gray, lineWidth: 2.0)
                )
        }
        .padding()
    }
}


struct VoteSliderView: View {
    
    let title: String
    let maxLabel: String
    let minLabel: String
    
    @State var value: Double = 1
    
    var body: some View {
        HStack {
            HStack{
                Text("\(title): ")
                    .font(.headline)
                Text("\(Int(value))")
                    .font(.headline)
            }
            .frame(width: UIScreen.main.bounds.width / 5, alignment: .trailing)
            Slider(
                value: $value,
                in: 1...5,
                step: 1.0,
                minimumValueLabel: {
                    Text(maxLabel)
                        .font(.headline)
                }(),
                maximumValueLabel: {
                    Text(minLabel)
                        .font(.headline)
                }(),
                label: {EmptyView()}
            )
            .padding(.leading)
            .padding(.trailing)
        }
    }
}

struct VoteView_Previews: PreviewProvider {
    static var previews: some View {
        VoteView()
    }
}
