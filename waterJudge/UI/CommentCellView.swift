//
//  CommentCellView.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2022/12/30.
//

import SwiftUI

struct CommentCellView: View {
    
    let comment: String
    let score: String
    
    init(comment: String, score: Double) {
        self.comment = comment
        self.score = String(round(score * 100) / 100)
    }
    
    
    var body: some View {
        HStack {
            Image(systemName: "person")
            Text(comment)
            Text(score)
        }
    }
}

struct CommentCellView_Previews: PreviewProvider {
    static var previews: some View {
        CommentCellView(comment: "げぼおお", score: 2.98000)
    }
}
