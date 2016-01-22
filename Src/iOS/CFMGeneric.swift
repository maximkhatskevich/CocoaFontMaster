//
//  CFMGeneric.swift
//  CocoaFontMaster-iOS
//
//  Created by Maxim Khatskevich on 21/01/16.
//  Copyright © 2016 Maxim Khatskevich. All rights reserved.
//

import UIKit

//===

class CFMConfig
{
    // MARK: Private class methods
    
    private static func configDict() -> NSDictionary?
    {
        var result: NSDictionary? = nil
        
        //===
        
        let configFileName = "CFMConfig"
        let bundleWithConfig = NSBundle.mainBundle()
        
        if let configPath = bundleWithConfig.pathForResource(configFileName, ofType: "plist")
        {
            result = NSDictionary.init(contentsOfFile: configPath)
        }
        
        //===
        
        return result
    }
    
    private static func fontName(metaFontId: String) -> String?
    {
        var result: String? = nil
        
        //===
        
        if
            let configDict = configDict(),
            let value = configDict[metaFontId]
        {
            result = value as? String
        }
        
        //===
        
        return result
    }
    
    // MARK: Public class methods
    
    static func font(metaFontId: String, fontSize: CGFloat) -> UIFont?
    {
        var result: UIFont? = nil
        
        //===
        
        if let fontName = fontName(metaFontId)
        {
            result = UIFont.init(name: fontName, size: fontSize)
        }
        
        //===
        
        return result
    }
    
    static func defaultFont() -> UIFont?
    {
        var result: UIFont? = nil
        
        //===
        
        let defaultFontNameKey = "CFMDefaultFontName"
        let defaultFontSizeKey = "CFMDefaultFontSize"
        
        if
            let configDict = configDict(),
            let fontName = configDict[defaultFontNameKey] as? String,
            let fontSize = configDict[defaultFontSizeKey] as? NSNumber
        {
            result = UIFont.init(name: fontName, size: CGFloat(fontSize))
        }
        
        //===
        
        return result
    }
}

//===

// http://stackoverflow.com/a/33099277

// for UIControl-based classes
// without direct access to .font property

public protocol CFMUIControlBasic: class
{
    var cfm_actualFont: UIFont! { get set }
    var cfm_defaultFont: UIFont { get }
}

extension CFMUIControlBasic
{
    // MARK: Public properties
    
    public var cfm_defaultFont: UIFont
    {
        get
        {
            return (CFMConfig.defaultFont() ?? UIFont.systemFontOfSize(15.0))
        }
    }
    
    // MARK: Public methods
    
    func cfm_font(metaFontId: String) -> UIFont?
    {
        return CFMConfig.font(metaFontId, fontSize: cfm_actualFont.pointSize)
    }
    
    func cfm_updateFont(metaFontId: String?, fontSize: CGFloat)
    {
        if
            let fontId = metaFontId,
            let newFont = cfm_font(fontId)
        {
            cfm_actualFont = newFont
        }
        else
        {
            // default fallback
            
            cfm_actualFont = cfm_defaultFont
        }
    }
    
    func cfm_updateFont(metaFontId: String?)
    {
        cfm_updateFont(metaFontId, fontSize: cfm_actualFont.pointSize)
    }
}

//===

public protocol CFMUIControlWithFont: CFMUIControlBasic
{
    // required (inherited/existing) properties:
    
    var font: UIFont! { get set }
}

extension CFMUIControlWithFont
{
    // MARK: Public properties
    
    public var cfm_actualFont: UIFont!
    {
        get
        {
            return font
        }
        set
        {
            font = newValue
        }
    }
}

//===

public protocol CFMUIControlWithOptionalFont: CFMUIControlBasic
{
    // required (inherited/existing) properties:
    
    var font: UIFont? { get set }
}

extension CFMUIControlWithOptionalFont
{
    // MARK: Public properties
    
    public var cfm_actualFont: UIFont!
    {
        get
        {
            return (font ?? cfm_defaultFont)
        }
        set
        {
            font = newValue
        }
    }
}
