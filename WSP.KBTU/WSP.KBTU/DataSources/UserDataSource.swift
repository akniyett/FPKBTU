//
//  UserDataSource.swift
//  WSP.KBTU
//
//  Created by Lidiya Karnaukhova on 25.05.2022.
//

import Foundation

class UserDataSource {
    let users: [User] = [
        User(login: "1", password: "1"),
        User(login: "journalist_1@news.com", password: "qwerty1"),
        User(login: "journalist_2@news.com", password: "qwerty2"),
        User(login: "journalist_3@news.com", password: "qwerty3")
    ]
    
    func getUserData() -> [User] {
        return users
    }
}
