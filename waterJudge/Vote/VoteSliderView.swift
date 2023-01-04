//
//  VoteSliderView.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2023/01/04.
//

import SwiftUI

struct VoteSliderView: View {
    
    let title: String
    let maxLabel: String
    let minLabel: String
    
    @State var value: Double = 1
    
    var body: some View {
        HStack {
            
            HStack{
                Text("\(title): ")
                Text("\(Int(value))")
                    .font(.headline)
            }
            .frame(
                minWidth: UIScreen.main.bounds.width / 5,
                alignment: .trailing
            )
            
            Slider(
                value: $value,
                in: 1...5,
                step: 1.0,
                minimumValueLabel: {
                    Text(maxLabel)
                }(),
                maximumValueLabel: {
                    Text(minLabel)
                }(),
                label: {EmptyView()}
            )
            .padding(.leading)
            .padding(.trailing)
            
        }
    }
}

struct VoteSliderView_Previews: PreviewProvider {
    static var previews: some View {
        VoteSliderView(title: "title", maxLabel: "max", minLabel: "min")
    }
}
