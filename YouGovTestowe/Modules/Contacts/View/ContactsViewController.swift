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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()

    }


    private func createUI() {
        self.view.backgroundColor = UIColor.white
        
        self.title = "Contacts"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.view.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()
        }
        
    }
}

extension ContactsViewController: ContactsViewProtocol { }

