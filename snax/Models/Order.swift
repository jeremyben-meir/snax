//
//  Order.swift
//  snax
//
//  Created by Jessica Yuan on 5/6/19.
//  Copyright © 2019 Jessica Yuan. All rights reserved.
//

import Foundation

struct CreateOrderResponse: Codable{
    var data: CreateOrderDataResponse
}

struct CreateOrderDataResponse: Codable{
    var order: Order
}

struct GetActiveOrderResponse: Codable{
    var data: GetActiveOrderDataResponse
}

struct GetActiveOrderDataResponse: Codable{
    var id: Int
}

struct AddFoodToOrderResponse: Codable{
    var data: AddFoodToOrderDataResponse
}

struct AddFoodToOrderDataResponse: Codable{
    var order: Order
}
