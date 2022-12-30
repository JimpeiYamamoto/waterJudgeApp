//
//  VoteView.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2022/12/29.
//

import SwiftUI

struct VoteView: View {
    
    @State var isDoneVote: Bool = false
    
    var body: some View {
        NavigationView{
            ScrollView {
                HStack {
                    Text("居住地:")
                    Text("神奈川県 川崎市")
                }
                .padding()
                
                if isDoneVote {
                    WaitView()
                } else {
                    YetVoteView()
                }

            }
            .navigationTitle("2022-12/29")
            .navigationBarItems(trailing:Button(action: {
            }, label: {
                Image(systemName: "person.circle.fill")
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
