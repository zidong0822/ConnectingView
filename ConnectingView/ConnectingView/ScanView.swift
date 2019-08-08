//
//  ScanView.swift
//  ConnectView
//
//  Created by harvey on 2019/2/28.
//  Copyright © 2019 harvey. All rights reserved.
//

import UIKit
import Pulsator
class ScanView: UIView {

    var animationTimer:Timer?
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(buggyImageView)
        addSubview(mobileImageView)
        addSubview(tipLabel)
    }
    
    override func layoutSubviews() {
        buggyImageView.frame = CGRect(x:(frame.size.width-121)/2, y:120, width:121, height: 92)
        mobileImageView.frame = CGRect(x:(frame.size.width-192)/2, y:frame.size.height-111, width: 192, height: 111)
        tipLabel.frame = CGRect(x:(frame.size.width-260)/2, y: 30, width: 260, height: 30)
        let pulsator = Pulsator()
        pulsator.backgroundColor = UIColor(rgba:"#FF7D28").cgColor
        pulsator.radius = 240.0
        pulsator.numPulse = 4
        pulsator.position = buggyImageView.center
        layer.addSublayer(pulsator)
        subviews.forEach({bringSubviewToFront($0)})
        pulsator.start()
        startAnimation()
        animationTimer = Timer()
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (timer) in
            self.startAnimation()
        }
    }
    
    func startAnimation(){
        let currentFrame = CGRect(x:(frame.size.width-192)/2, y:frame.size.height-111, width: 192, height: 111)
        self.mobileImageView.frame = CGRect(x: currentFrame.origin.x, y:frame.size.height, width: currentFrame.size.width, height: currentFrame.size.height)
        self.mobileImageView.alpha = 1
        UIView.animate(withDuration: 1, animations: { () -> Void in
            self.mobileImageView.frame = currentFrame
        })
        UIView.animate(withDuration: 2, animations: { () -> Void in
            self.mobileImageView.alpha = 0
        })
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate lazy var buggyImageView:UIImageView = {
        let buggyImageView = UIImageView()
        buggyImageView.image = UIImage(named:"icon_device_buggy")
        return buggyImageView
    }()
    
    fileprivate lazy var mobileImageView:UIImageView = {
        let mobileImageView = UIImageView()
        mobileImageView.image = UIImage(named:"icon_mobile_connect")
        return mobileImageView
    }()
    
    fileprivate lazy var tipLabel:UILabel = {
        let tipLabel = UILabel()
        tipLabel.text = "将手机靠近小强，蓝牙将自动连接！"
        tipLabel.textColor = .white
        tipLabel.textAlignment = .center
        tipLabel.adjustsFontSizeToFitWidth = true
        return tipLabel
    }()
    
    fileprivate var pulsator:Pulsator = {
        let pulsator = Pulsator()
        pulsator.backgroundColor = UIColor.red.cgColor
        pulsator.radius = 240.0
        pulsator.numPulse = 4
        return pulsator
    }()
    
}
