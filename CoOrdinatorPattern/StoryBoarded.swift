//
//  StoryBoarded.swift
//  CoOrdinatorPattern
//
//  Created by Ashika Shetty on 14/03/22.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main2", bundle: .main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
        
    }
}
