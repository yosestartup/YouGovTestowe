//
//  ContactsProtocols.swift
//  YouGovTestowe
//
//  Created by Oleksandr Bambulyak on 20/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

protocol ContactsViewProtocol: class {
    func insertContacts(dictionary: [String: [String]])
}

protocol ContactsWireFrameProtocol: class { }

protocol ContactsPresenterProtocol: class {
    func viewIsLoaded()
}

protocol ContactsInteractorProtocol: class {
    func fetchContacts(completion: @escaping ([String: [String]]?) -> Void)
}

