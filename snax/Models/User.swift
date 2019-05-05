//
//  User.swift
//  snax
//
//  Created by Jeremy Ben-Meir on 4/25/19.
//  Copyright © 2019 Jessica Yuan. All rights reserved.
//
import Foundation

struct User: Codable {
    var id: Int
    var name: String
    var orders: Int
    
    
//
//    var email: String
//    var idToken: String
//    var fullName: String
//    var givenName: String
//    var familyName: String
}

struct CreateUserResponse: Codable {
    var data: User
}
