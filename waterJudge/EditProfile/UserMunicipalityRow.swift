//
//  UserMunicipality.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2023/01/04.
//

import SwiftUI

struct UserMunicipalityRow: View {
    
    let municipalities:[MunicipalitlyModel]
    @Binding var selectedMId: Int
    
    var body: some View {
        
        HStack {
            Text("市区")
                .frame(
                    width: UIScreen.main.bounds.width / 5,
                    alignment: .leading
                )
            Picker(midToName(id: selectedMId), selection: $selectedMId) {
                ForEach(municipalities, id: \.mid) { municipality in
                    Text(municipality.name).tag(municipality.mid)
                }
            }
        }
        
    }
    
    func midToName(id: Int) -> String {
        for municipality in self.municipalities {
            if municipality.mid == id {
                return municipality.name
            }
        }
        return "未選択"
    }
    
}
