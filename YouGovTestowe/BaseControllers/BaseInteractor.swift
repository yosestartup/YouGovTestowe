//
//  BaseInteractor.swift
//  YouGovTestowe
//
//  Created by Oleksandr Bambulyak on 20/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

class BaseInteractor {

    var dataProvider: DataProvider! = nil

    init(dataProvider: DataProvider) {
        self.dataProvider = dataProvider
    }
}
