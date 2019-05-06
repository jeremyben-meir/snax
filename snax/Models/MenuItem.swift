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
    var comments: String?
    var description: String?
    var id: Int
    var name: String
    var price: CGFloat
}


