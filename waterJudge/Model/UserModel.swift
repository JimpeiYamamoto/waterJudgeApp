//
//  UserModel.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2022/12/30.
//

import Foundation

struct UserModel: Identifiable{
    let id: String = UUID().uuidString
    let userName: String
    let prefectures: String
    let municipalities: String
}
