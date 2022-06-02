//
//  User.swift
//  WSP.KBTU
//
//  Created by Lidiya Karnaukhova on 25.05.2022.
//

import Foundation

struct User {
    var login: String
    var password: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(login)
        hasher.combine(password)
    }
}
