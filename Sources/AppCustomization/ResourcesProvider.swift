//
//  ResourcesSourcer.swift
//  Velvioo
//
//  Created by Garnik Ghazaryan on 2/28/20.
//  Copyright © 2020 Garnik Ghazaryan. All rights reserved.
//

import Development_Support
import Foundation

class ResourcesProvider {

    static let shared = ResourcesProvider()
    static let local = ResourcesProvider(from: "mock_settings")

    var settings: [String: Any]?

    init(from file: String) {
        settings = loadLocally(fileName: file)
    }

    init() {
        settings = ["": ""] // Should be get from network somehow
    }

    func loadLocally(fileName: String) -> [String: Any]? {
        return Utils.readJson(fileName: fileName)
    }
    // TODO: - Add Localization to customizable texts -
}
