//
//  ContactsDataSource.swift
//  YouGovTestowe
//
//  Created by Oleksandr Bambulyak on 20/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation
import UIKit

class ContactsDataSource: UITableViewDiffableDataSource<String, String> {
    
    private var contacts: [String: [String]] = ["a": ["alpha", "amega"], "b": ["beta", "boris"], "c": ["centavra", "cypr"]]

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = self.snapshot().sectionIdentifiers[section]
        return section
    }
    
    func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<String, String>()
        
        let sections = Array(self.contacts.keys.sorted())
        snapshot.appendSections(sections)
        
        for section in sections {
            snapshot.appendItems(self.contacts[section] ?? [], toSection: section)
        }
        
        self.apply(snapshot)
    }
}
