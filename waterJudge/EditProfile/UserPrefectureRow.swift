//
//  UserPrefectureRow.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2023/01/04.
//

import SwiftUI

struct UserPrefectureRow: View {
    
    let prefectures: [PrefectureModel]
    @Binding var selectedId: Int
    
    var body: some View {
        HStack {
            Text("都道府県")
                .frame(
                    width: UIScreen.main.bounds.width / 5,
                    alignment: .leading
                )
            Picker("\(prefectures[selectedId-1].name)", selection: $selectedId) {
                ForEach(prefectures, id: \.id) { prefecture in
                    Text(prefecture.name).tag(prefecture.id)
                }
            }
        }
    }
}
