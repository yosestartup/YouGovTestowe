//
//  DIResolver.swift
//  YouGovTestowe
//
//  Created by Oleksandr Bambulyak on 20/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

// MARK: - DIResolver
class DIResolver {

    let dataProvider: DataProviderProtocol

    // MARK: - Init
    init(dataProvider: DataProviderProtocol) {
        self.dataProvider = dataProvider
    }

}
