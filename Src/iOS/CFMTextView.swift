//
//  CFMTextView.swift
//  CocoaFontMaster-iOS
//
//  Created by Maxim Khatskevich on 1/22/16.
//  Copyright © 2016 Maxim Khatskevich. All rights reserved.
//

import UIKit

//===

extension UITextView: CFMUIControlWithOptionalFont { }

//===

public class CFMMetaFontTextView: UITextView
{
    @IBInspectable var metaFontId: String? = nil
        {
        didSet
        {
            cfm_updateFont(metaFontId)
        }
    }
}
