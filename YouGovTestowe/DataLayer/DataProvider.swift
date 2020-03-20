//
//  DataProvider.swift
//  YouGovTestowe
//
//  Created by Oleksandr Bambulyak on 20/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//
import Foundation

class DataProvider: DataProviderProtocol {
    
    private var contacts: [String] = [String]()
    
    init(array: [String]) {
        self.contacts = array
    }
    
    func deleteDuplicates(from array: [String]) -> [String] {
        return Array(Set(array.compactMap({$0.lowercased()})))
    }
    
    func createDictionary(from array: [String]) -> [String: [String]] {
        let alphabet = array.sorted(by: { $0 < $1 }).compactMap({ $0.first?.lowercased() })
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
        let contactsWithoutDuplicates = deleteDuplicates(from: contacts)
        let contactsDictionary = createDictionary(from: contactsWithoutDuplicates)
        completion(contactsDictionary)
    }
}
