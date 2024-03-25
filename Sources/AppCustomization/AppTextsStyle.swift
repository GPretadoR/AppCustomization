//
//  AppStyles.swift
//  Velvioo
//
//  Created by Garnik Ghazaryan on 3/13/20.
//  Copyright © 2020 Garnik Ghazaryan. All rights reserved.
//

import Development_Support
import UIKit

public struct FontAppearance {
    @CodableUserDefault(key: "fonts", defaultValue: [.none : ""])
    public static var fontStyles: [FontWeight : String]

    public enum FontWeight: String, Codable {
        case bold
        case medium
        case regular
        case light
        case none
    }
}

public struct TextAttributes {
    public var font: UIFont
    public var textColor: UIColor?
}

public enum TextsStyles {
    case none

    case bold(CGFloat)
    case medium(CGFloat)
    case regular(CGFloat)
    case light(CGFloat)

    public var style: TextAttributes {
        return style(for: self)
    }

    private func style(for style: TextsStyles) -> TextAttributes {
        switch self {
        case .bold(let size):
            guard let fontName = FontAppearance.fontStyles[.bold],
                    let font = UIFont(name: fontName, size: size)
            else { return TextAttributes(font: UIFont.systemFont(ofSize: size, weight: .bold)) }
            return TextAttributes(font: font)
        case .medium(let size):
            guard let fontName = FontAppearance.fontStyles[.medium],
                    let font = UIFont(name: fontName, size: size)
            else { return TextAttributes(font: UIFont.systemFont(ofSize: size, weight: .medium)) }

            return TextAttributes(font: font)
        case .regular(let size):
            guard let fontName = FontAppearance.fontStyles[.regular],
                    let font = UIFont(name: fontName, size: size)
            else { return TextAttributes(font: UIFont.systemFont(ofSize: size, weight: .regular)) }

            return TextAttributes(font: font)
        case .light(let size):
            guard let fontName = FontAppearance.fontStyles[.light],
                    let font = UIFont(name: fontName, size: size)
            else { return TextAttributes(font: UIFont.systemFont(ofSize: size, weight: .light)) }

            return TextAttributes(font: font)
        default:
            return TextAttributes(font: UIFont.systemFont(ofSize: 17))
        }
    }
}

public extension TextsStyles {
    init?(style: TextsStyles) {
        self = style
    }
}
