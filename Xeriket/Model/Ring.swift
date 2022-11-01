//
//  Ring.swift
//  Xeriket
//
//  Created by Waris Ruzi on 2022/11/01.
//

import SwiftUI

//MARK: Progress Ring Model and Sample Data

struct Ring: Identifiable{
    var id = UUID().uuidString
    var progress: CGFloat
    var value: String
    var keyIcon: String
    var keyColor: Color
    var isText: Bool = false
}

var rings: [Ring] = [
    Ring(progress: 83, value: "قەدەم", keyIcon: "figure.walk", keyColor: Color("Green")),
    Ring(progress: 34, value: "كالورىيە", keyIcon: "flame.fill", keyColor: Color("Red")),
    Ring(progress: 91, value: "ئۇخلاش ۋاقتى", keyIcon: "bed.double.fill", keyColor: Color("Purple"),isText: true)

]

 
