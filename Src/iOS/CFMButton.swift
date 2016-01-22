//
//  CFMButton.swift
//  CocoaFontMaster-iOS
//
//  Created by Maxim Khatskevich on 21/01/16.
//  Copyright © 2016 Maxim Khatskevich. All rights reserved.
//

import UIKit

//===

public class CFMMetaFontButton: UIButton
{
    @IBInspectable var metaFontId: String? = nil
        {
        didSet
        {
            self.titleLabel!.cfm_updateFont(metaFontId)
        }
    }
}
