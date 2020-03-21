//
//  BaseInteractor.swift
//  YouGovTestowe
//
//  Created by Oleksandr Bambulyak on 20/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

class BaseInteractor {

    var dataProvider: DataProviderProtocol! = nil

    init(dataProvider: DataProviderProtocol) {
        self.dataProvider = dataProvider
    }
}
