//
//  ContactsViewController.swift
//  YouGovTestowe
//
//  Created by Oleksandr Bambulyak on 20/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//
import UIKit

class ContactsViewController: BaseViewController {

    var presenter: ContactsPresenterProtocol!
    
    private var tableView: UITableView = UITableView()
    
    private var dataSource: ContactsDataSource?
    private var reuseIdentifier: String = "CellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()
        self.createDataSource()
        self.presenter.viewDidLoad()
    }

    private func createUI() {
        self.view.backgroundColor = UIColor.white
        
        self.title = "Contacts"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.view.addSubview(self.tableView)
        
        self.tableView.allowsSelection = false
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.reuseIdentifier)
        
        let tableViewConstraints = [
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ]
        NSLayoutConstraint.activate(tableViewConstraints)
    }
    
    private func createDataSource() {
        self.dataSource = ContactsDataSource(tableView: self.tableView, cellProvider: { (tableView, indexPath, contact) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath)
            cell.textLabel?.text = contact
            return cell
        })
    }
}

extension ContactsViewController: ContactsViewProtocol {
    
    func insertContacts(dictionary: [String: [String]]) {
        self.dataSource?.insertContacts(dictionary: dictionary)
    }
}

extension ContactsViewController: ContactsDataSourceDelegate {
    
    func reloadTable() {
        self.tableView.reloadData()
    }
}
