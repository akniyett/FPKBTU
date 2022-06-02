//
//  UserViewModel.swift
//  WSP.KBTU
//
//  Created by Lidiya Karnaukhova on 26.04.2022.
//

import Foundation

class UserViewModel {
    
    let dataSource: UserDataSource
    var user: [User] = []
    
    init() {
        dataSource = UserDataSource()
    }
    
    func getUserData() -> [User] {
        user = dataSource.getUserData()
        return user
    }
}
