//
//  Coordinator.swift
//  CoOrdinatorPattern
//
//  Created by Ashika Shetty on 14/03/22.
//

import UIKit

// needs to be class only because the coordinators gets passed around multiple places
protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] {get set}
    var navigation: UINavigationController {get set}
    
    func start()
}
