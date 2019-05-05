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
    var firstName: String
    var lastName: String
    var email: String
    var orders: [Order]
}

struct CreateUserResponse: Codable {
    var data: User
}

struct GetUserResponse: Codable {
    var data: User
}

struct Order: Codable {
    var id: Int
    var matched: Bool
    var placed: Bool
    var food: [MenuItem]
}
