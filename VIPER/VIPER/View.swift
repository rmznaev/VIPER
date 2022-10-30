//
//  View.swift
//  VIPER
//
//  Created by Ramazan Abdullayev on 30.10.22.
//

import Foundation
import UIKit

// ViewConroller
// protocol
// reference presenter

protocol AnyView {
    var presenter: AnyPresenter? { get set }
    
    func update(with users: [User])
    func update(with error: String)
}

class UserView: UIViewController, AnyView {
    var presenter: AnyPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // view setup goes here
    }
    
    func update(with users: [User]) {
        
    }
    
    func update(with error: String) {
        
    }
}
