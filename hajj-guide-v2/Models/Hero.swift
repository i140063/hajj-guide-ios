//
//  Hero.swift
//  hajj-guide-v2
//
//  Created by Project  on 30/07/2018.
//  Copyright © 2018 Kindred Spirits. All rights reserved.
//

import Foundation

class Hero {
    
    var id: Int
    var name: String?
    var powerRanking: Int
    
    init(id: Int, name: String?, powerRanking: Int){
        self.id = id
        self.name = name
        self.powerRanking = powerRanking
    }
}
