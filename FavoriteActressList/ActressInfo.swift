//
//  ActressInfo.swift
//  FavoriteActressList
//
//  Created by leejungchul on 2021/02/16.
//

import UIKit

struct ActressInfo {
    let name: String
    let explain: String
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, explain: String) {
        self.name = name
        self.explain = explain
    }
}
