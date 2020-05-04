// TransparentCoachMarkArrowView.swift
//
// Copyright (c) 2015, 2016 Frédéric Maquin <fred@ephread.com>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit
import Instructions

// Transparent coach mark (text without background, cool arrow)
internal class TransparentCoachMarkArrowView : UIImageView, CoachMarkArrowView {
    // MARK: - Initialization
    init(orientation: CoachMarkArrowOrientation) {
        switch orientation {
        case .top:
            super.init(image: UIImage(named: "arrow_top"))
        case .topLeft:
            super.init(image: UIImage(named: "arrow_top_left"))
        case .topRight:
            super.init(image: UIImage(named: "arrow_top_right"))
        case .bottom:
            super.init(image: UIImage(named: "arrow_bottom"))
        case .bottomLeft:
            super.init(image: UIImage(named: "arrow_bottom_left"))
        case .bottomRight:
            super.init(image: UIImage(named: "arrow_bottom_right"))
        case .leftTop:
            super.init(image: UIImage(named: "arrow_left_top"))
        case .leftBottom:
            super.init(image: UIImage(named: "arrow_left_bottom"))
        case .rightTop:
            super.init(image: UIImage(named: "arrow_right_top"))
        case .rightBottom:
            super.init(image: UIImage(named: "arrow_right_bottom"))
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let image = self.image {
            self.addConstraint(NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal,
                                                  toItem: nil, attribute: .notAnAttribute,
                                                  multiplier: 1, constant: image.size.width))
            
            self.addConstraint(NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal,
                                                  toItem: nil, attribute: .notAnAttribute,
                                                  multiplier: 1, constant: image.size.height))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding.")
    }
}
