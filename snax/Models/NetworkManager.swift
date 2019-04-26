//
//  NetworkManager.swift
//  L7
//
//  Created by Mindy Lou on 4/11/18.
//  Copyright © 2018 Mindy Lou. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    private static let endpoint = "http://35.236.231.84/api/snax/"
    
    static func loginPost(userID: String, idToken: String, name: String, givenName: String, familyName: String, email: String, completion: @escaping (User) -> Void) {
        let parameters: [String: Any] = [
            "userId": userID,
            "idToken": idToken,
            "fullName": name,
            "givenName": givenName,
            "familyName": familyName,
            "email": email
        ]
        Alamofire.request(endpoint, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: [:]).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let jsonDecoder = JSONDecoder()
                if let user = try? jsonDecoder.decode(User.self, from: data) {
                    completion(user)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func loginGet(idToken: String, completion: @escaping ([User]) -> Void) {
        Alamofire.request(endpoint, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let jsonDecoder = JSONDecoder()
                if let user = try? jsonDecoder.decode(UserResponse.self, from: data) {
                    completion(user.data.users)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
