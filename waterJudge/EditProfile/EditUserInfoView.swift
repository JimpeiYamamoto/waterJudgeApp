//
//  EditUserInfoView.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2022/12/30.
//

import SwiftUI

struct EditUserInfoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var userId: Int = 1
    @State var userName: String = ""
    @State var userPrefectureId: Int = 10
    @State var userMunicipalityId: Int = 0
    
    let prefecturesModel: [PrefectureModel] = decodePreJson()
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle")
                .font(.largeTitle)
                .padding()
            List {
                UserNameRow(input: $userName)
                
                UserPrefectureRow(
                    prefectures: prefecturesModel,
                    selectedId: $userPrefectureId
                )
                
                UserMunicipalityRow(
                    municipalities: prefecturesModel[userPrefectureId-1].municipalities,
                    selectedMId: $userMunicipalityId)
            }
            .listStyle(.plain)
            .onAppear {
                if let fetchuser = fetchUser() {
                    userId = fetchuser.userId
                    userName = fetchuser.userName
                    userPrefectureId = fetchuser.preId
                    userMunicipalityId = fetchuser.muniId
                }
            }
        }
        .navigationTitle("プロフィールを編集")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button(action: {
            
            presentationMode.wrappedValue.dismiss()
            
            saveUser(user: UserModel(
                userId: 1,
                userName: userName,
                preId: userPrefectureId,
                preName: prefecturesModel[userPrefectureId-1].name,
                muniId: userMunicipalityId,
                muniName: prefecturesModel[userPrefectureId-1].midToName(id: userMunicipalityId))
            )
            
        }, label: {
            Text("完了")
        }))
    }
}


func decodePreJson()-> [PrefectureModel] {
    guard let url = Bundle.main.url(
        forResource: "prefecture", withExtension: "json"
    ) else {
        fatalError("not found")
    }
    guard let data = try? Data(contentsOf: url) else {
        fatalError("not read")
    }
    let decoder = JSONDecoder()
    guard let prefectures = try? decoder.decode(
        [PrefectureModel].self,
        from: data
    ) else {
        fatalError("not JSON decode")
    }
    return prefectures
}

struct EditUserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        EditUserInfoView()
    }
}
