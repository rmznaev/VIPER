//
//  Interactor.swift
//  VIPER
//
//  Created by Ramazan Abdullayev on 30.10.22.
//

import Foundation

// object
// protocol
// reference to presenter

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }
    
    func getUsers()
}

class UserInteractor: AnyInteractor {
    var presenter: AnyPresenter?
    
    func getUsers() {
        
    }
}
