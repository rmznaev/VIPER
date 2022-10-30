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

class UserViewController: UIViewController, AnyView {
    var presenter: AnyPresenter?
    
    var users: [User] = []
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.isHidden = true
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self,
                       forCellReuseIdentifier: "cell")
        
        return table
    }()
    
    private lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemYellow
        
        view.addSubview(tableView)
        view.addSubview(errorLabel)
        
        tableView.frame = view.bounds
        
        NSLayoutConstraint.activate([
            errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            errorLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    //MARK: - Presenter methods

    func update(with users: [User]) {
        DispatchQueue.main.async { [weak self] in
            self?.users = users
            self?.tableView.reloadData()
            self?.tableView.isHidden = false
            self?.errorLabel.isHidden = true
        }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async { [weak self] in
            self?.errorLabel.text = error
            self?.tableView.isHidden = true
            self?.errorLabel.isHidden = false
        }
    }
}

extension UserViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        
        return cell
    }
}
