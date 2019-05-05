//
//  MenuItem.swift
//  snax
//
//  Created by Jeremy Ben-Meir on 4/25/19.
//  Copyright © 2019 Jessica Yuan. All rights reserved.
//

import Foundation
import UIKit

struct RestaurantMenuItemResponse: Codable{
    var data: [MenuItem]
    
}
struct MenuItem: Codable{
    var name: String
    var price: CGFloat
    var description: String
    
}

//enum ItemCategory {
//    case breakfast
//    case lunch
//    case dinner
//    case side
//    case drink
//}
//struct MenuItem: Codable {
//    var name: String
//    var price: CGFloat
//    var description: String

    //var category: ItemCategory?
    
//    init(name: String, price: CGFloat, description: String, category: ItemCategory?){
//        self.name = name
//        self.price =  price
//        self.description = description
//        if let itemcategory: ItemCategory = category{
//            self.category = itemcategory
//        }
//}
