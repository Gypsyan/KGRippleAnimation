//
//  KGRippleButton.swift
//  KGRippleAnimation
//
//  Created by Anantha Krishnan K G on 06/11/16.
//  Copyright © 2016 Ananth. All rights reserved.
//

import UIKit
import Foundation

public class KGRippleButton: UIButton {

    
    public convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    public override convenience init(frame: CGRect) {
        self.init(frame: frame, image: UIImage())
    }
    public init(frame: CGRect, image: UIImage!) {
        super.init(frame: frame)
        self.addTarget(self, action:#selector(selectAction), for: [.touchUpInside, .touchDown, .touchDragExit, .touchDragEnter, .touchCancel])
        self.setTitle("Default", for: .normal)
        self.setTitleColor(UIColor.black, for: .normal)
        self.backgroundColor = UIColor.blue
    }
   
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    public func selectAction() {
        
        let activityIndicatorView = KGRippleAnimation(frame: frame,color: UIColor.red);
        activityIndicatorView.startAnimating()
        self.addSubview(activityIndicatorView)
        let when = DispatchTime.now() + 1 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            activityIndicatorView.stopAnimating()
        }
    }

 

}
