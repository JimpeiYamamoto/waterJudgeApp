//
//  UserModel.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2022/12/30.
//

import Foundation

struct UserModel: Codable{
    
    let userName: String
    let preId: Int
    let preName: String
    let muniId: Int
    let muniName: String
    
}

func fetchUser() -> UserModel? {
    let key = "user"
    guard
        let data = UserDefaults.standard.data(forKey: key),
        let savedUser = try? JSONDecoder().decode(UserModel.self, from: data)
    else { return nil }
    return savedUser
}

func saveUser(user: UserModel) {
    let key = "user"
    if let encodedData = try? JSONEncoder().encode(user) {
        UserDefaults.standard.set(encodedData, forKey: key)
    }
}
