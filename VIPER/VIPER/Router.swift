//
//  Router.swift
//  VIPER
//
//  Created by Ramazan Abdullayev on 30.10.22.
//

import Foundation

// object
// entry point for module

protocol AnyRouter {
    static func start() -> AnyRouter
}

class UserRouter: AnyRouter {
    static func start() -> AnyRouter {
        let router = UserRouter()
        
        // Assign VIP
        
        return router
    }
}
