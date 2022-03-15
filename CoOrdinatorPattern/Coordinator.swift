//
//  Coordinator.swift
//  CoOrdinatorPattern
//
//  Created by Ashika Shetty on 14/03/22.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] {get set}
    var navigation: UINavigationController {get set}
    
    func start()
}
