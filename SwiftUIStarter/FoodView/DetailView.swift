//
//  DetailView.swift
//  SwiftUIStarter
//
//  Created by Max Aryus on 08.03.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    @State var showOrderSheet = false
    
    
    var currentCategory: Categories
    
    var body: some View {
        List(filterData(by: currentCategory)) {
            food in DetailRow(showOrderSheet: self.$showOrderSheet, food: food)
        }
        .navigationBarTitle(Text(categoryString(category: currentCategory)), displayMode: .inline)
        .sheet(isPresented: $showOrderSheet){
            OrderFrom(showOrderSheet: self.$showOrderSheet)
        }
    }
}

func categoryString (category: Categories) -> String {
    
    switch category {
    case .burger:
        return "Burger"
    case .pizza:
        return "Pizza"
    case .pasta:
        return "Pasta"
    case .dessert:
        return "Dessert"
    }
    
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(currentCategory: .burger)
    }
}
