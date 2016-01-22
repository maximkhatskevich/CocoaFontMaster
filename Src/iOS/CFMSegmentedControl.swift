//
//  CFMSegmentedControl.swift
//  CocoaFontMaster-iOS
//
//  Created by Maxim Khatskevich on 21/01/16.
//  Copyright © 2016 Maxim Khatskevich. All rights reserved.
//

import UIKit

//===

extension UISegmentedControl: CFMUIControlBasic
{
    // MARK: Public properties
    
    public var cfm_actualFont: UIFont!
    {
        get
        {
            var result: UIFont
            
            //===
            
            if
                let textAttributes = self.titleTextAttributesForState(.Normal),
                let font = textAttributes[NSFontAttributeName] as? UIFont
            {
                result = font
            }
            else
            {
                result = cfm_defaultFont
            }
            
            //===
            
            return result
        }
        set
        {
            var textAttributes = self.titleTextAttributesForState(.Normal)
            
            if textAttributes == nil
            {
                textAttributes = [:]
            }
            
            textAttributes![NSFontAttributeName] = newValue
            
            //===
            
            setTitleTextAttributes(textAttributes, forState: .Normal)
        }
    }
}

//===

public class CFMMetaFontSegmentedControl: UISegmentedControl
{
    @IBInspectable var metaFontId: String? = nil
        {
        didSet
        {
            cfm_updateFont(metaFontId)
        }
    }
}