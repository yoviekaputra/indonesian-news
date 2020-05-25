//
//  FontConfig.swift
//  Indonesian News
//
//  Created by yoviekaputra on 04/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import UIKit

/* FONT */
let FONT_REGULAR                             =   "Roboto-Regular"
let FONT_BOLD                                =   "Roboto-Bold"
let FONT_LIGHT                               =   "Roboto-Light"
let FONT_THIN                                =   "Roboto-Thin"

let FONT_SIZE_EXTRA_SMALL: CGFloat = 10
let FONT_SIZE_SMALL: CGFloat = 12
let FONT_SIZE_MEDIUM: CGFloat = 14
let FONT_SIZE_BIG: CGFloat = 18
let FONT_SIZE_EXTRA_BIG: CGFloat = 24
let FONT_SIZE_DOUBLE_EXTRA_BIG: CGFloat = 28

struct FontSizes {
    let iPhone4     = CGRect(x: 0.0, y: 0.0, width: 320.0, height: 480.0)
    let iPhone5     = CGRect(x: 0.0, y: 0.0, width: 320.0, height: 568.0)
    let iPhone6     = CGRect(x: 0.0, y: 0.0, width: 375.0, height: 667.0)
    let iPhonePlus  = CGRect(x: 0.0, y: 0.0, width: 414.0, height: 736.0)
    let screenSize: CGRect = UIScreen.main.bounds

    func setOnboardingFontSize(_ value : CGFloat) -> CGFloat {
        if screenSize == iPhone4 {
            return value - 3
        } else if screenSize == iPhone5 {
            return value - 1
        } else if screenSize == iPhone6 {
            return value
        } else if screenSize == iPhonePlus {
            return value  + 5
        }
        return value
    }
    
    func setLabelFontSize(_ value : CGFloat) -> CGFloat {
        if screenSize == iPhone4 {
            return value - 1
        } else if screenSize == iPhone5 {
            return value - 1
        } else if screenSize == iPhone6 {
            return value
        } else if screenSize == iPhonePlus {
            return value  + 1
        }
        return value
    }
}

class FontConfig {
    private var font: UIFont? = nil
    private let fontSize = FontSizes()
    
    init(font: UIFont?) {
        self.font = font
    }
    
    func setTextExtraSmall() -> UIFont? {
        return  UIFont(name: FONT_REGULAR, size: fontSize.setLabelFontSize(CGFloat(FONT_SIZE_EXTRA_SMALL)))
    }
    
    func setTextSmall() -> UIFont? {
        return UIFont(name: FONT_REGULAR, size: fontSize.setLabelFontSize(CGFloat(FONT_SIZE_SMALL)))
    }
    
    func setTextMedium() -> UIFont? {
        return UIFont(name: FONT_REGULAR, size: fontSize.setLabelFontSize(CGFloat(FONT_SIZE_MEDIUM)))
    }
    
    func setTextBig() -> UIFont? {
        return UIFont(name: FONT_REGULAR, size: fontSize.setLabelFontSize(FONT_SIZE_BIG))
    }
    
    func setTextExtraBig() -> UIFont? {
        return UIFont(name: FONT_REGULAR, size: fontSize.setLabelFontSize(FONT_SIZE_EXTRA_BIG))
    }
    
    func setTextDoubleExtraBig() -> UIFont? {
        return UIFont(name: FONT_REGULAR, size: fontSize.setLabelFontSize(FONT_SIZE_DOUBLE_EXTRA_BIG))
    }
    
    /* Additional */
    func setBold() -> UIFont? {
        return UIFont(name: FONT_BOLD, size: fontSize.setLabelFontSize(font?.pointSize ?? FONT_SIZE_MEDIUM))
    }
    
    func setTextSize(size: CGFloat) -> UIFont? {
        return UIFont(name: font?.fontName ?? FONT_REGULAR, size: fontSize.setLabelFontSize(size))
    }
}

extension UITextField {
    func setBold() { self.font = FontConfig(font: font).setBold() }
    
    func setTextSize(size: CGFloat) { self.font = FontConfig(font: font).setTextSize(size: size) }
    
    func setTextExtraSmall() { self.font = FontConfig(font: font).setTextExtraSmall() }
    
    func setTextSmall() { self.font = FontConfig(font: font).setTextSmall() }
    
    func setTextMedium() { self.font = FontConfig(font: font).setTextMedium() }
    
    func setTextBig() { self.font = FontConfig(font: font).setTextBig() }
    
    func setTextExtraBig() { self.font = FontConfig(font: font).setTextExtraBig() }
    
    func setTextDoubleExtraBig() { self.font = FontConfig(font: font).setTextDoubleExtraBig() }
}

extension UILabel {
    func setBold() { self.font = FontConfig(font: font).setBold() }
    
    func setTextSize(size: CGFloat) { self.font = FontConfig(font: font).setTextSize(size: size) }
    
    func setTextExtraSmall() { self.font = FontConfig(font: font).setTextExtraSmall() }
    
    func setTextSmall() { self.font = FontConfig(font: font).setTextSmall() }
    
    func setTextMedium() { self.font = FontConfig(font: font).setTextMedium() }
    
    func setTextBig() { self.font = FontConfig(font: font).setTextBig() }
    
    func setTextExtraBig() { self.font = FontConfig(font: font).setTextExtraBig() }
    
    func setTextDoubleExtraBig() { self.font = FontConfig(font: font).setTextDoubleExtraBig() }
}

extension UITextView {
    func setBold() { self.font = FontConfig(font: font).setBold() }
    
    func setTextSize(size: CGFloat) { self.font = FontConfig(font: font).setTextSize(size: size) }
    
    func setTextExtraSmall() { self.font = FontConfig(font: font).setTextExtraSmall() }
    
    func setTextSmall() { self.font = FontConfig(font: font).setTextSmall() }
    
    func setTextMedium() { self.font = FontConfig(font: font).setTextMedium() }
    
    func setTextBig() { self.font = FontConfig(font: font).setTextBig() }
    
    func setTextExtraBig() { self.font = FontConfig(font: font).setTextExtraBig() }
    
    func setTextDoubleExtraBig() { self.font = FontConfig(font: font).setTextDoubleExtraBig() }
}
