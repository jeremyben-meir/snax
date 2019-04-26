//
//  MenuItem.swift
//  snax
//
//  Created by Jeremy Ben-Meir on 4/25/19.
//  Copyright © 2019 Jessica Yuan. All rights reserved.
//

import Foundation
import UIKit

enum ItemCategory {
    case breakfast
    case lunch
    case dinner
    case side
}
class MenuItem {
    var name: String
    var price: CGFloat
    var description: String
    var category: ItemCategory?
    
    
    init(name: String, price: CGFloat, description: String, category: ItemCategory?){
        self.name = name
        self.price =  price
        self.description = description
        if let itemcategory: ItemCategory = category{
            self.category = itemcategory
        }
    }
}
