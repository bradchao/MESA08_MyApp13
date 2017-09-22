//
//  MyView.swift
//  MyApp13
//
//  Created by user22 on 2017/9/22.
//  Copyright © 2017年 Brad Big Company. All rights reserved.
//

import UIKit

class MyView: UIView {

    private var dx:CGFloat = 0.0, dy:CGFloat = 0.0
    private var isInit = false
    private var viewW:CGFloat = 0
    private var viewH:CGFloat = 0
    private let ballImage = UIImage(named: "ball");
    private var ballX:CGFloat = 0
    private var ballY:CGFloat = 0
    private var ballW:CGFloat? = 0
    private var ballH:CGFloat? = 0
    
    private func initMyView(rect: CGRect){
        viewW = rect.size.width
        viewH = rect.size.height

        ballW = ballImage?.size.width
        ballH = ballImage?.size.height
        
        isInit = true
    }
    
    override func draw(_ rect: CGRect) {
        if !isInit {initMyView(rect: rect)}
        
        let context = UIGraphicsGetCurrentContext()
        context?.saveGState()
        
//        context?.setLineWidth(2)
//        context?.setStrokeColor(red: 0, green: 0, blue: 1, alpha: 1)
//        
//        context?.move(to: CGPoint(x: 0, y: 0))
//        context?.addLine(to: CGPoint(x: dx, y: dy))
//        context?.drawPath(using: .stroke)

        
        ballImage?.draw(at: CGPoint(x: ballX, y: ballY))
        
        context?.restoreGState()
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let x = touch.location(in: self).x
            let y = touch.location(in: self).y
//            print("\(x) : \(y)")
//            dx = x
//            dy = y
            
            ballX = x - ( ballW! / CGFloat(2) )
            ballY = y - ( ballH! / CGFloat(2) )
            setNeedsDisplay()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let touch = touches.first {
//            let x = touch.location(in: self).x
//            let y = touch.location(in: self).y
//            print("\(x) : \(y)")
//            dx = x
//            dy = y
//            setNeedsDisplay()
//        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    

}
