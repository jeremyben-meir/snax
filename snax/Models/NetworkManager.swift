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
    
    private static let restaurantEndpoint = "http://35.236.231.84/api/snax/restaurants/"
    private static let createUserEndpoint = "http://35.236.231.84/api/snax/users/"
    private static let getUserEndpoint = "http://35.236.231.84/api/snax/user/"
   
    
    //RestaurantMenuItemDataReponse is a list of menu items
    //Gets the list of menu items for the restaurant named name
    static func getRestaurantMenuItems(name: String, completion: @escaping ([MenuItem]) -> Void) {
        let newname = name.replacingOccurrences(of: " ", with: "%20")
        Alamofire.request("http://35.236.231.84/api/snax/restaurant/\(newname)/food/", method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let jsonDecoder = JSONDecoder()
                if let restaurantMenuItemResponse = try? jsonDecoder.decode(RestaurantMenuItemResponse.self, from: data) {
                    let menu = restaurantMenuItemResponse.data
                    completion(menu)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
                print("create error")
            }
        }
    }

    static func createUserPost(firstName: String, lastName: String, email: String, completion: @escaping (User) -> Void) {
        let parameters: [String: Any] = [
            "firstName": firstName,
            "lastName": lastName,
            "email": email
        ]
        Alamofire.request(createUserEndpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).validate().responseData
            { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let jsonDecoder = JSONDecoder()
                if let response = try? jsonDecoder.decode(CreateUserResponse.self, from: data) {
                    completion(response.data)
                    print("received user with id \(response.data.id)")
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
                print("BOY")
            }
        }
    }
    
    static func loginGet(email: String, completion: @escaping (User?) -> Void) {
        Alamofire.request("http://35.236.231.84/api/snax/user/\(email)", method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let jsonDecoder = JSONDecoder()
                if let response = try? jsonDecoder.decode(GetUserResponse.self, from: data) {
                    completion(response.data)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
                print("get error")
                completion(nil)
            }
        }
    }
    
    static func createOrderPost(email: String, completion: @escaping (Order) -> Void) {
        Alamofire.request("http://35.236.231.84/api/snax/order/\(email)/", method: .post).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let jsonDecoder = JSONDecoder()
                if let createOrderResponse = try? jsonDecoder.decode(CreateOrderResponse.self, from: data) {
                   let order = createOrderResponse.data.order
                    completion(order)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func addFoodToCart(restaurantName: String, foodName: String, orderId: Int, completion: @escaping (MenuItem) -> Void) {
        let parameters: [String: Any] = [
            "restaurantName": restaurantName,
            "foodName": foodName,
        ]
        Alamofire.request("http://35.236.231.84/api/snax/order/food/\(orderId)/", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let jsonDecoder = JSONDecoder()
                if let addFoodToOrderResponse = try? jsonDecoder.decode(AddFoodToOrderResponse.self, from: data) {
                    let foodItem = addFoodToOrderResponse.data
                    completion(foodItem)
                } else {
                    print("Invalid Response Data (add food to cart)")
                }
            case .failure(let error):
                print(error.localizedDescription)
                print("add food to cart error")
            }
        }
    }
    
    static func getActiveOrder(email: String, completion: @escaping (Order?) -> Void) {
        Alamofire.request("http://35.236.231.84/api/snax/user/recentOrder/\(email)/", method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print("ACTIVE ORDER \(json)")
                }
                let jsonDecoder = JSONDecoder()
                if let getActiveOrderResponse = try? jsonDecoder.decode(GetActiveOrderResponse.self, from: data) {
                    completion(getActiveOrderResponse.order)
                } else {
                    print("Invalid Response Data (get active order)")
                }
            case .failure(let error):
                print(error.localizedDescription)
                print("get active order error")
            }
        }
    }
    
}


