//
//  Presenter.swift
//  VIPER
//
//  Created by Ramazan Abdullayev on 30.10.22.
//

import Foundation

// object
// protocol
// reference to interactor
// reference to router
// reference to view

protocol AnyPresenter {
    var view: AnyView? { get set }
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    
    func interactorDidFetchUsers(with result: Result<[User], Error>)
}

class UserPresenter: AnyPresenter {
    var view: AnyView?
    var router: AnyRouter?
    var interactor: AnyInteractor?
    
    func interactorDidFetchUsers(with result: Result<[User], Error>) {
        
    }
}
