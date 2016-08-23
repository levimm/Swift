//
//  User.swift
//  Autolayout
//
//  Created by Ma Levi on 3/20/16.
//  Copyright © 2016 Levi. All rights reserved.
//

import Foundation

struct User {
    let name: String
    let company: String
    let login: String
    let password: String
    
    static func login(login: String, password: String) -> User?
    {
        if let user = database[login]
        {
            if user.password == password
            {
                return user
            }
        }
        return nil
    }
    
    static let database: Dictionary<String, User> =
    {
        var theDatabase = Dictionary<String, User>()
        for user in
        [
            User(name: "John", company: "Apple", login: "John", password: "foo"),
            User(name: "Madison", company: "Google", login: "Madison", password: "foo")
        ]
        {
            theDatabase[user.login] = user
        }
        return theDatabase
    }()
}