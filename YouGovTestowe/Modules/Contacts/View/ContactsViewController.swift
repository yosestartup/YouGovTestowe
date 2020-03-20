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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()

    }


    private func createUI() {
        self.view.backgroundColor = UIColor.red
    }
}
extension ContactsViewController: ContactsViewProtocol { }
