//
//  CommentCellView.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2022/12/30.
//

import SwiftUI

struct CommentCellView: View {
    
    let commentModel: CommentCellModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack() {
                Image(systemName: "person")
                    .foregroundColor(.white)
                Text(commentModel.userName)
                    .underline()
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Text(String(round(commentModel.score * 100) / 100))
                    .font(.headline)
                    .foregroundColor(.white)
            }
            
            HStack {
                Text(commentModel.comment)
                    .font(.headline)
                    .frame(maxWidth: UIScreen.main.bounds.width / 20 * 18)
                    .foregroundColor(.white)
            }
            
        }
        .padding()
        .background(
            Rectangle()
                .foregroundColor(.green)
                .cornerRadius(20)
        )
    }
}

struct CommentCellView_Previews: PreviewProvider {
    static var previews: some View {
        CommentCellView(commentModel: CommentCellModel(
            userName: "jimpei", comment: "おいしいね", score: 2.2)
        )
    }
}
