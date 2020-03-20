//
//  DataProvider.swift
//  YouGovTestowe
//
//  Created by Oleksandr Bambulyak on 20/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

class DataProvider {
    
    func deleteDuplicates(from array: [String]) -> [String] {
        return Array(Set(array))
    }
    
    func createDictionary(from array: [String]) -> [String: [String]] {
        let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".lowercased().map({ String($0) })
        var result = [String:[String]]()
        for letter in alphabet {
            let matches = array.filter({ $0.hasPrefix(letter) }).sorted()
            if !matches.isEmpty {
                result[letter] = []
                for word in matches {
                    result[letter]?.append(word)
                }
            }
        }
        return result
    }
    
    func getContacts(completion: @escaping ([String : [String]]?) -> Void) {
        let contactsWithoutDuplicates = deleteDuplicates(from: Contacts.names)
        let contactsDictionary = createDictionary(from: contactsWithoutDuplicates)
        completion(contactsDictionary)
    }
}
