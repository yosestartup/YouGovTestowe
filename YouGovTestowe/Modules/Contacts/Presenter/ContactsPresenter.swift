//
//  ContactsPresenter.swift
//  YouGovTestowe
//
//  Created by Oleksandr Bambulyak on 20/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

class ContactsPresenter: BasePresenter {

    weak var view: ContactsViewProtocol?
    private var wireFrame: ContactsWireFrameProtocol
    private var interactor: ContactsInteractorProtocol

    init(view: ContactsViewProtocol, wireFrame: ContactsWireFrameProtocol, interactor: ContactsInteractorProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireFrame = wireFrame
    }
}

extension ContactsPresenter: ContactsPresenterProtocol {
    
    func viewDidLoad() {
        self.interactor.fetchContacts { (contacts) in
            if let contacts = contacts {
                self.view?.insertContacts(dictionary: contacts)
            } else {
                self.view?.showOkAlertController(title: "Error", message: "Data is not loaded", callback: nil)
            }
        }
    }
}
