//
//  KGRippleAnimation.swift
//  KGRippleAnimation
//
//  Created by Anantha Krishnan K G on 06/11/16.
//  Copyright © 2016 Ananth. All rights reserved.
//

import UIKit
import Foundation

public class KGRippleAnimation: UIView {
    
    
    /// The ripples color value.
    private var color_default = UIColor.red
    private var padding: CGFloat = 0
    
    public init(frame: CGRect, color: UIColor? = nil) {
        
        super.init(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        self.color_default = color ?? color_default
        isHidden = false
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.clear
        fatalError("init(coder:) has not been implemented. Sorry for the troubles")
    }
    
    private func setUpAnimation() {
        var animationRect = UIEdgeInsetsInsetRect(frame, UIEdgeInsetsMake(padding, padding, padding, padding))
        layer.sublayers = nil
        animationRect.size = CGSize(width: frame.width, height: frame.height)
        let size = animationRect.size ;
        let color = self.color_default;
        let duration: CFTimeInterval = 1.25
        let beginTime = CACurrentMediaTime()
        let beginTimes = [0.0, 0.25, 0.45]
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.16, 0.46, 0.68, 0.85)
        
        
        // Opacity animation
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        
        opacityAnimation.keyTimes = [0, 0.7, 1]
        opacityAnimation.timingFunctions = [timingFunction, timingFunction]
        opacityAnimation.values = [1, 0.7, 0]
        opacityAnimation.duration = duration
        
        // Scale animation
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        
        scaleAnimation.keyTimes = [0, 0.7]
        scaleAnimation.timingFunction = timingFunction
        scaleAnimation.values = [0, 1.0]
        scaleAnimation.duration = duration

        // Animation
        let animation = CAAnimationGroup()
        
        animation.animations = [scaleAnimation, opacityAnimation]
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        
        // Draw circles
        for i in 0 ..< 3 {
            let circle = addLayer(size: size, color: color)
            let frame = CGRect(x: (layer.bounds.size.width - size.width) ,
                               y: (layer.bounds.size.height - size.height) ,
                               width: size.width,
                               height: size.height)
            
            animation.beginTime = beginTime + beginTimes[i]
            circle.frame = frame
            circle.add(animation, forKey: "animation")
            layer.addSublayer(circle)
        }
    }
    
    func addLayer(size: CGSize, color: UIColor) -> CALayer {
        
        let layer: CAShapeLayer = CAShapeLayer()
        let path: UIBezierPath = UIBezierPath()
        let lineWidth: CGFloat = 2
        
        path.addArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                    radius: max(frame.width, frame.height)/1.7,
                    startAngle: 0,
                    endAngle: CGFloat(2 * M_PI),
                    clockwise: false);
        layer.fillColor = nil
        layer.strokeColor = color.cgColor
        layer.lineWidth = lineWidth
        
        layer.backgroundColor = nil
        layer.path = path.cgPath
        layer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        return layer
    }
    
    public func startAnimating() {
        setUpAnimation()
    }
    public func stopAnimating() {
        isHidden = true
        layer.sublayers?.removeAll()
        removeFromSuperview();
    }
}
