//
//  ContactsViewController.swift
//  YouGovTestowe
//
//  Created by Oleksandr Bambulyak on 20/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import UIKit
import SnapKit

class ContactsViewController: BaseViewController {

    var presenter: ContactsPresenterProtocol!
    
    private var tableView: UITableView = UITableView()
    
    private var dataSource: ContactsDataSource?
    private var reuseIdentifier: String = "CellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()
        self.createDataSource()
        self.presenter.viewIsLoaded()
    }

    private func createUI() {
        self.view.backgroundColor = UIColor.white
        
        self.title = "Contacts"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.view.addSubview(self.tableView)
    
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        self.tableView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()
        }
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
