//
//  ContactsInteractor.swift
//  YouGovTestowe
//
//  Created by Oleksandr Bambulyak on 20/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

class ContactsInteractor: BaseInteractor { }

extension ContactsInteractor: ContactsInteractorProtocol {
    func fetchContacts(completion: @escaping ([String : [String]]?) -> Void) {
        self.dataProvider.getContacts(completion: completion)
    }
}
