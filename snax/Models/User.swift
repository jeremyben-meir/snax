//
//  User.swift
//  snax
//
//  Created by Jeremy Ben-Meir on 4/25/19.
//  Copyright © 2019 Jessica Yuan. All rights reserved.
//
import Foundation

struct User: Codable {
    var userId: String
    var idToken: String
    var fullName: String
    var givenName: String
    var familyName: String
    var email: String
}

struct UserResponse: Codable {
    var data: UserDataResponse
}

struct UserDataResponse: Codable {
    var users: [User]
}
