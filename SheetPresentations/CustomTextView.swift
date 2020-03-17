//
//  CustomTextView.swift
//  SheetPresentations
//
//  Created by Atsuki Kakehi on 2020/03/17.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CustomTextView: UITextView {
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        configureInit()
//    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureInit()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("debug0000 CustomTextView touchesBegan")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("debug0000 CustomTextView touchesEnded")
    }
    
    func configureInit() {
//        addSubviewFittingEdges(view: contentViewFromOwnedNib)
        print("debug0000 CustomTextView configureInit")
    }

    
}


