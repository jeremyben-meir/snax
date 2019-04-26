//
//  Restaurant.swift
//  snax
//
//  Created by Jessica Yuan on 4/21/19.
//  Copyright © 2019 Jessica Yuan. All rights reserved.
//

import Foundation
import UIKit

class Restaurant {
    
    var image: UIImage?
    var name: String
    var tags: [String]
    var priceImage: UIImage?
    var times: [[Int]]
    var isOpen: Bool
    var menu: [MenuItem]
    
    init(image: UIImage, name: String, tags: [String], price: Int, times: [[Int]], menu: [MenuItem] = []){
        self.image = image
        self.name = name
        self.tags = tags
        self.times = times
        if (price<15){
            self.priceImage = UIImage(named: "d1")!
        } else if (price<30){
            self.priceImage = UIImage(named: "d2")!
        } else {
            self.priceImage = UIImage(named: "d3")!
        }
        self.menu = menu
        self.isOpen = true
        self.isOpen = checkIfOpen(time: times)
    }
    
    func checkIfOpen(time: [[Int]]) -> Bool {
        let hour = Calendar.current.component(.hour, from: Date())
        let minutes = Calendar.current.component(.minute, from: Date())
        let weekday = Calendar.current.component(.weekday, from: Date())
        
        var dayTime = time[weekday-1]
        
        if ((hour > dayTime[0] && hour < dayTime[2])||(hour == dayTime[0] && minutes >= dayTime[1])||(hour == dayTime[2] && minutes < dayTime[3])){
            return true
        } else if (dayTime.count == 4){
            return false
        } else if ((hour > dayTime[4] && hour < dayTime[6])||(hour == dayTime[4] && minutes >= dayTime[5])||(hour == dayTime[6] && minutes < dayTime[7])){
            return true
        } else {
            return false
        }
    }

}
