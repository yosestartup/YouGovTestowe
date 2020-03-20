//
//  Contacts+DIResolver.swift
//  YouGovTestowe
//
//  Created by Oleksandr Bambulyak on 20/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

// MARK: - Contacts
protocol ContactsProtocol {
    func presentContactsViewController() -> UIViewController
}

extension DIResolver: ContactsProtocol {
    func presentContactsViewController() -> UIViewController {
        let viewController = ContactsViewController()
        let interactor = ContactsInteractor(dataProvider: self.dataProvider)
        let wireFrame = ContactsWireFrame(resolver: self)
        let presenter = ContactsPresenter(view: viewController, wireFrame: wireFrame, interactor: interactor)
        viewController.presenter = presenter
        return viewController
    }
}
