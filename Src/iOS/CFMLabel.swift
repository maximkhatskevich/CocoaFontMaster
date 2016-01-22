//
//  CFMLabel.swift
//  CocoaFontMaster-iOS
//
//  Created by Maxim Khatskevich on 21/01/16.
//  Copyright © 2016 Maxim Khatskevich. All rights reserved.
//

import UIKit

//===

extension UILabel: CFMUIControlWithFont { }

//===

public class CFMMetaFontLabel: UILabel
{
    @IBInspectable var metaFontId: String? = nil
        {
            didSet
            {
                cfm_updateFont(metaFontId)
            }
        }
}
