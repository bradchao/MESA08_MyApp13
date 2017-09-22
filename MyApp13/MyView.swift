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
    private var ballDX:CGFloat = 8
    private var ballDY:CGFloat = 8
    
    private var balls:[Ball] = []
    
    private func initMyView(rect: CGRect){
        viewW = rect.size.width
        viewH = rect.size.height

        ballW = ballImage?.size.width
        ballH = ballImage?.size.height
        
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true){
            (_) in
            self.setNeedsDisplay()
        }
        
        
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

        for ball in balls {
            ball.ballImage?.draw(at: CGPoint(x: ball.ballX, y: ball.ballY))
        }
        
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

            balls += [Ball(x: ballX, y: ballY, view: self)]
            
//            Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true){
//                (_) in
//                self.BallTask()
//            }
            
        }
    }
    
    
    private func BallTask(){
        if ballX + ballW! > viewW ||
            ballX < 0 {
            ballDX *= -1
        }
        if ballY + ballH! > viewH ||
            ballY < 0 {
            ballDY *= -1
        }
        ballX += ballDX
        ballY += ballDY
        setNeedsDisplay()
    }
    
    class Ball {
        let ballImage = UIImage(named: "ball");
        var ballX:CGFloat = 0
        var ballY:CGFloat = 0
        var ballW:CGFloat? = 0
        var ballH:CGFloat? = 0
        var ballDX:CGFloat = 8
        var ballDY:CGFloat = 8
        var view:MyView?

        init(x: CGFloat, y:CGFloat, view:MyView) {
            ballX = x; ballY = y
            ballW = ballImage?.size.width
            ballH = ballImage?.size.height
            self.view = view
            
            Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true){
                (_) in
                self.BallTask()
            }
        }
        
        private func BallTask(){
            if ballX + ballW! > (self.view?.viewW)! ||
                ballX < 0 {
                ballDX *= -1
            }
            if ballY + ballH! > (self.view?.viewH)! ||
                ballY < 0 {
                ballDY *= -1
            }
            ballX += ballDX
            ballY += ballDY
            //self.view?.setNeedsDisplay()
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
