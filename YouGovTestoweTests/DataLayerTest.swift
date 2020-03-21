//
//  YouGovTestoweTests.swift
//  YouGovTestoweTests
//
//  Created by Oleksandr Bambulyak on 20/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import XCTest
@testable import YouGovTestowe

class DataLayerTest: XCTestCase {

    var dataProvider: DataProvider! = nil
    var wordsWithDuplicates: [String]! = nil
    var wordsWithoutDuplicates: [String]! = nil
    var wordsDividedDictionary: [String: [String]]! = nil
    
    override func setUp() {
        self.wordsWithDuplicates = ["alarm", "amanda", "alarm", "zero", "bobby", "spectrum", "spectrum", "saturn", "bobcat", "cook", "cook", "cook", "amanda", "certificate"]
        self.wordsWithoutDuplicates = ["alarm", "zero", "bobby", "spectrum", "saturn", "bobcat", "cook", "amanda", "certificate"]
        self.wordsDividedDictionary = ["a":["alarm", "amanda"],
                                       "b": ["bobby", "bobcat"],
                                       "c": ["certificate", "cook"],
                                       "s": ["saturn", "spectrum"],
                                       "z": ["zero"]]
        
        self.dataProvider = DataProvider(array: self.wordsWithoutDuplicates)
    }

    override func tearDown() {
        self.wordsWithDuplicates = nil
        super.tearDown()
    }

    func testDuplicatesDeletion() {
        let afterDuplicatesDeletetion = dataProvider.deleteDuplicates(from: self.wordsWithDuplicates)
        XCTAssertEqual(self.wordsWithoutDuplicates.sorted(), afterDuplicatesDeletetion.sorted(), "WRONG RESULT. Bad duplicates deletion")
    }
    
    func testDictionaryCreation() {
        let createdDictionary = dataProvider.createDictionary(from: self.wordsWithoutDuplicates)
        XCTAssertEqual(self.wordsDividedDictionary, createdDictionary, "WRONG RESULT. Bad created dictionary")
    }
    
    func testGettingContacts() {
        let dictionaryPromise = expectation(description: "Dictionary successfully created")
        self.dataProvider.getContacts { (contactsDictionary) in
            
            if let contactsDictionary = contactsDictionary {
                if(contactsDictionary == self.wordsDividedDictionary) {
                    dictionaryPromise.fulfill()
                } else {
                    XCTFail("WRONG RESULT. Bad created dictionary")
                }
            } else {
                XCTFail("WRONG RESULT. Dictionary didn't received")
            }
        }
        wait(for: [dictionaryPromise], timeout: 3)
    }
}
