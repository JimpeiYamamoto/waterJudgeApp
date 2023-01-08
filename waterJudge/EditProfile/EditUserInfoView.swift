//
//  EditUserInfoView.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2022/12/30.
//

import SwiftUI

struct EditUserInfoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var isAlertShow = false
    
    @State var userId: Int = 1
    @State var userName: String = ""
    @State var preId: Int = 1
    @State var munId: Int = 0
    
    let prefecturesModel: [PrefectureModel] = decodePreJson()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image(systemName: "person.circle")
                        .font(.largeTitle)
                        .padding()
                }
                List {
                    UserNameRow(input: $userName)
                    
                    UserPrefectureRow(
                        prefectures: prefecturesModel,
                        selectedId: $preId
                    )
                    
                    UserMunicipalityRow(
                        municipalities: prefecturesModel[preId-1].municipalities,
                        selectedMId: $munId
                    )
                }
                .listStyle(.plain)
                .onAppear {
                    if let fetchuser = fetchUser() {
                        userId = fetchuser.userId
                        userName = fetchuser.userName
                        preId = fetchuser.preId
                        munId = fetchuser.muniId
                    }
                }
            }
            .navigationTitle("プロフィールを編集")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {
                if isValiUserName(name: userName) && isValiPreMuni(preId: preId, muniId: munId) {
                    saveUser(user: UserModel(
                        userId: 1,
                        userName: userName,
                        preId: preId,
                        preName: prefecturesModel[preId-1].name,
                        muniId: munId,
                        muniName: prefecturesModel[preId-1].midToName(id: munId))
                    )
                    presentationMode.wrappedValue.dismiss()
                } else {
                    isAlertShow.toggle()
                }
            }, label: {
                Text("完了")
            }))
            .alert(isPresented: $isAlertShow) {
                Alert(title: Text(""),
                      message: Text("「ユーザーネーム]「都道府県」「市区」が入力されていることを確認してください")
                )
            }
        }
        .interactiveDismissDisabled()
    }
    
    func isValiUserName(name: String) -> Bool {
        if name == "" {
            return false
        }
        return true
    }

    func isValiPreMuni(preId: Int, muniId: Int) -> Bool {
        if preId > 47 {
            return false
        }
        if midToName(id: muniId, municipalities: self.prefecturesModel[preId-1].municipalities) == "" {
            return false
        }
        return true
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
