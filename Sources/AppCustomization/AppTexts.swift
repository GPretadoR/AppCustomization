//
//  Texts.swift
//  Velvioo
//
//  Created by Garnik Ghazaryan on 2/28/20.
//  Copyright © 2020 Garnik Ghazaryan. All rights reserved.
//

import Foundation

public class AppTexts {

    class func string(string: String) -> String {
        return AppTexts.string(string: string, key: nil)
    }

    class func string(string: String, key: String?) -> String {
        return AppTexts.string(string: string, key: key, sourceLocal: true) // Local is default here. It can be changes, using some mechanisms
    }

    class func string(string: String, key: String?, sourceLocal: Bool) -> String {
        let textsDict = textsSource(local: sourceLocal)
        if let key = key, let value = textsDict[key] {
            return value
        }
        return string
    }

    private class func textsSource(local: Bool) -> [String: String] {
        return local ? ResourcesProvider.local.settings?["texts"] as? [String: String] ?? ["": ""] : ResourcesProvider.shared.settings?["texts"] as? [String: String] ?? ["": ""]
    }
}
