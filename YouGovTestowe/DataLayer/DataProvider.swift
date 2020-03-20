//
//  DataProvider.swift
//  YouGovTestowe
//
//  Created by Oleksandr Bambulyak on 20/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

class DataProvider {
    
    let dict: [String: [String]] = ["a": ["alpha", "amega"], "b": ["beta", "boris"], "c": ["centavra", "cypr"]]
    func getContacts(completion: @escaping ([String : [String]]?) -> Void) {
        completion(dict)
    }
}
