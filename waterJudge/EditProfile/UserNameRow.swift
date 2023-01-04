//
//  UserNameRow.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2023/01/04.
//

import SwiftUI

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
