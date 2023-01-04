//
//  EditUserInfoView.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2022/12/30.
//

import SwiftUI

struct EditUserInfoView: View {
    
    var userModel: UserModel
    @Environment(\.presentationMode) var presentationMode
    
    @State var userNameInput: String = ""
    @State var userPrefectureInput: String = ""
    @State var userMunicipality: String = ""
    
    init() {
        // UserDefaultで撮ってくるように変更したい
        self.userModel = UserModel(
            userName: "hoge1", prefectures: "神奈川県", municipalities: "川崎市"
        )
    }
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle")
                .font(.largeTitle)
                .padding()
            List {
                UserNameRow(input: $userNameInput)
                UserPrefectureRow(input: $userPrefectureInput)
                UserMunicipality(input: $userMunicipality)
            }
            .listStyle(.plain)
            .onAppear {
                userNameInput = userModel.userName
                userPrefectureInput = userModel.prefectures
                userMunicipality = userModel.municipalities
            }
        }
        .navigationTitle("プロフィールを編集")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("完了")
        }))
    }
}

struct UserNameRow: View {
    
    @Binding var input: String
    
    var body: some View {
        HStack {
            Text("ユーザーネーム")
                .frame(
                    width: UIScreen.main.bounds.width / 5,
                    alignment: .leading
                )
            TextField("", text: $input)
                .submitLabel(.done)
        }
    }
}

struct UserPrefectureRow: View {
    
    @Binding var input: String
    
    var body: some View {
        HStack {
            Text("都道府県")
                .frame(
                    width: UIScreen.main.bounds.width / 5,
                    alignment: .leading
                )
            Text(input)
        }
    }
}

struct UserMunicipality: View {
    
    @Binding var input: String
    
    var body: some View {
        
        HStack {
            Text("市区")
                .frame(
                    width: UIScreen.main.bounds.width / 5,
                    alignment: .leading
                )
            Text(input)
        }
        
    }
}

struct EditUserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        EditUserInfoView()
    }
}
