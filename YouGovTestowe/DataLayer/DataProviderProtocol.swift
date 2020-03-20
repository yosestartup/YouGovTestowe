//
//  DataProviderProtocol.swift
//  YouGovTestowe
//
//  Created by Oleksandr Bambulyak on 21/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

protocol DataProviderProtocol {
    func getContacts(completion: @escaping ([String : [String]]?) -> Void)
}
