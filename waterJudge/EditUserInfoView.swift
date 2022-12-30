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
    
    init() {
        // UserDefaultで撮ってくるように変更したい
        self.userModel = UserModel(
            userName: "hoge1", prefectures: "神奈川県", municipalities: "川崎市"
        )
    }
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle")
            Text(userModel.userName)
            Text(userModel.prefectures)
            Text(userModel.municipalities)
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("保存")
            }

        }
    }
}

struct EditUserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        EditUserInfoView()
    }
}
