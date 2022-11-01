//
//  Step.swift
//  Xeriket
//
//  Created by Waris Ruzi on 2022/11/01.
//

import SwiftUI

//MARK: Steps Bar Graph Model And Data
struct Step: Identifiable {
    var id = UUID().uuidString
    var value: CGFloat
    var key: String
    var color: Color = Color("Purple")
}

var steps: [Step] = [
    Step(value: 500, key: "1-4 AM"),
    Step(value: 250, key: "5-8 AM", color: Color("Green")),
    Step(value: 300, key: "9-11 AM"),
    Step(value: 420, key: "12-4 PM" ,color: Color("Green")),
    Step(value: 680, key: "5-8 PM"),
    Step(value: 540, key: "9-12 PM", color: Color("Green"))

]

