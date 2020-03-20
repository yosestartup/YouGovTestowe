//
//  ContactsDataSource.swift
//  YouGovTestowe
//
//  Created by Oleksandr Bambulyak on 20/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation
import UIKit

protocol ContactsDataSourceDelegate: class {
    func reloadTable()
}

class ContactsDataSource: UITableViewDiffableDataSource<String, String> {
    
    weak var delegate: ContactsDataSourceDelegate?
    
    private var contacts = [String: [String]]()

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = self.snapshot().sectionIdentifiers[section]
        return section
    }
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<String, String>()
        
        let sections = Array(self.contacts.keys.sorted())
        snapshot.appendSections(sections)
        
        for section in sections {
            guard let contacts = self.contacts[section] else { continue }
            snapshot.appendItems(contacts, toSection: section)
        }
        
        self.apply(snapshot)
    }
    
    func insertContacts(dictionary: [String: [String]]) {
        self.contacts = dictionary
        self.reloadData()
        DispatchQueue.main.async {
            self.delegate?.reloadTable()
        }
    }
}
