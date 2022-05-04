//
//  Colors.swift
//  Velvioo
//
//  Created by Garnik Ghazaryan on 2/28/20.
//  Copyright © 2020 Garnik Ghazaryan. All rights reserved.
//

import Development_Support
import UIKit

public class AppColors: UIColor {

    @UserDefault(key: "mainColor", defaultValue: "000000")
    static var mainColorHex: String {
        didSet {
            appMainThemeColor = AppColors.color(key: mainColorHex, else: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        }
    }

    @UserDefault(key: "secondaryColor", defaultValue: "FF3354")
    static var secondaryColorHex: String {
        didSet {
            appSecodaryThemeColor = AppColors.color(key: secondaryColorHex, else: #colorLiteral(red: 1, green: 0.2, blue: 0.3294117647, alpha: 1))
        }
    }

    /// Main theme color. Default is #00DD86 (0, 221, 134) Green
    static var appMainThemeColor = AppColors.color(key: mainColorHex, else: #colorLiteral(red: 0, green: 0.8666666667, blue: 0.5254901961, alpha: 1))

    /// Secondary Theme Color. Default is #FF3154 (255, 49, 84) Red
    static var appSecodaryThemeColor = AppColors.color(key: secondaryColorHex, else: #colorLiteral(red: 1, green: 0.2, blue: 0.3294117647, alpha: 1))

    /// Yerevan Ride icon's second part color. Default is #10495A
    static let appYerevanRideSecondPartColor = #colorLiteral(red: 0.06274509804, green: 0.2862745098, blue: 0.3529411765, alpha: 1)

    /// Ameriabank green color. Default is #005164
    static let ameriaGreen = #colorLiteral(red: 0, green: 0.3176470588, blue: 0.3921568627, alpha: 1)

    /// Mild Gray. #BABEC9 (189, 190, 201)
    static let appMildGrayColor = #colorLiteral(red: 0.7294117647, green: 0.7450980392, blue: 0.7882352941, alpha: 1)

    /// Gray. #888AA1 (136, 138, 161)
    static let appGrayColor = #colorLiteral(red: 0.5333333333, green: 0.5411764706, blue: 0.631372549, alpha: 1)

    /// Dark Gray. #4C556B (76, 85, 107)
    static let appDarkGrayColor = #colorLiteral(red: 0.2980392157, green: 0.3333333333, blue: 0.4196078431, alpha: 1)

    /// Background Gray Color. #F4F7FC (244, 247, 252)
    static let appBackgroundLightGrayColor = #colorLiteral(red: 0.9568627451, green: 0.968627451, blue: 0.9882352941, alpha: 1)

    /// Main Black Blue color. Default is #424D67 (66, 77, 103)
//    static let appMainBlackBlueColor = #colorLiteral(red: 0.2588235294, green: 0.3019607843, blue: 0.4039215686, alpha: 1)

    class func color(key: String, sourceLocal: Bool) -> UIColor {
        let colorsDict = colorsSource(local: sourceLocal)
        if let value = colorsDict[key] {
            return UIColor(hex: value) ?? UIColor(hex: "00000000")!
        }
        return .init(red: 0, green: 0, blue: 0, alpha: 0)
    }

    class func color(key: String, else defaultColor: UIColor) -> UIColor {
        return UIColor(hex: key) ?? defaultColor
    }

    class func color(key: String) -> UIColor {
        return color(key: key, sourceLocal: true) // Local is default here. It can be changes, using some mechanisms
    }

    private class func colorsSource(local: Bool) -> [String: String] {
        return local ? ResourcesProvider.local.settings?["colors"] as? [String: String] ?? ["": ""] : ResourcesProvider.shared.settings?["colors"] as? [String: String] ?? ["": ""]
    }
}
