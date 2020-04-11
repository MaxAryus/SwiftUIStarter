//
//  Helper.swift
//  SwiftUIStarter
//
//  Created by Max Aryus on 07.03.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import Foundation
import SwiftUI

enum Categories {
    case burger
    case pizza
    case dessert
    case pasta
}

func filterData(by category: Categories) -> [Food] {
    var filterdArray = [Food]()
    
    for food in foodData {
        if food.category == category {
            filterdArray.append(food)
        }
    }
    return filterdArray
}
