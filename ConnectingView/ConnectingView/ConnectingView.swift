//
//  LoadingView.swift
//  MakeApp
//
//  Created by harvey on 2018/11/10.
//  Copyright © 2018 harvey. All rights reserved.
//

import UIKit
import SwiftTheme
import Pulsator
import PromiseKit
enum LoadingType {
    case scan
    case timeout
    case error
    case check
    case buggybreak
    case success
    case upload
}
class ConnectingView: UIView {
    var type:LoadingType = .scan
    
    static private var instance : ConnectingView {
        return sharedInstance
    }
    static private let sharedInstance = ConnectingView()
    
    static func getInstance() -> ConnectingView {
        return instance
    }
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        self.backgroundColor = UIColor.clear
        self.initAll()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initAll(){
        self.addSubview(contentView)
        contentView.addSubview(scanView)
        contentView.addSubview(cancelButton)
        contentView.frame = UIScreen.main.bounds
        scanView.frame = contentView.frame
        cancelButton.frame = CGRect(x:contentView.frame.width-80, y:20, width:40, height: 40)
    }
    
    fileprivate lazy var contentView:UIView = {
        let contentView = UIView()
        contentView.backgroundColor = UIColor(rgba:"#FF9240")
        return contentView
    }()
    
    fileprivate lazy var cancelButton:UIButton = {
        let cancelButton = UIButton()
        cancelButton.setImage(UIImage(named:"icon_connect_cancel"), for:.normal)
        cancelButton.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        return cancelButton
    }()

    fileprivate lazy var scanView:ScanView = {
        let scanView = ScanView()
        return scanView
    }()
    
    fileprivate lazy var timeOutView:ConnecTimeOutView = {
        let timeOutView = ConnecTimeOutView()
        timeOutView.delegate = self
        return timeOutView
    }()
    
    fileprivate lazy var identifyErrorView:IdentifyErrorView = {
        let identifyErrorView = IdentifyErrorView()
        identifyErrorView.delegate = self
        return identifyErrorView
    }()
    
    fileprivate lazy var checkView:BuggyCheckView = {
        let checkView = BuggyCheckView()
        return checkView
    }()
    
    fileprivate lazy var breakView:BuggyBreakView = {
        let breakView = BuggyBreakView()
        breakView.delegate = self
        return breakView
    }()
    
    fileprivate lazy var successView:ConnectSuccessView = {
        let successView = ConnectSuccessView()
        return successView
    }()
    
    fileprivate lazy var uploadView:UploadView = {
        let uploadView = UploadView()
        return uploadView
    }()
    
    func show() {
        self.showInWindow()
    }
    
    func changeUploadProgess(progess:Float){
        uploadView.changeProgess(progess:progess)
    }
    
    @objc func dismiss() {
        let currentFrame = self.contentView.frame
        UIView.animate(withDuration: 0.15, animations: {
            self.contentView.frame = CGRect(x: currentFrame.origin.x, y: self.frame.height, width: currentFrame.size.width, height: currentFrame.size.height)
        }) { (_) in
            self.removeFromSuperview()
        }
    }
    
    private func showInWindow() {
            self.frame = UIScreen.main.bounds
            let window = UIApplication.shared.keyWindow
            window?.backgroundColor = UIColor.red
            window?.alpha = 1
            window?.addSubview(self)
            let currentFrame = self.contentView.frame
            self.contentView.frame = CGRect(x: currentFrame.origin.x, y:self.frame.height, width: currentFrame.size.width, height: currentFrame.size.height)
            UIView.animate(withDuration: 0.15, animations: { () -> Void in
                self.contentView.frame = currentFrame
            })
        }
    
    func changeStatus(type:LoadingType){
        contentView.subviews.forEach({if(!$0.isKind(of:UIButton.self)){$0.removeFromSuperview()}})
        switch type {
        case .scan:
            contentView.addSubview(scanView)
            scanView.frame = contentView.frame
            break
        case .timeout:
            contentView.addSubview(timeOutView)
            timeOutView.frame = contentView.frame
            break
        case .check:
            contentView.addSubview(checkView)
            checkView.frame = contentView.frame
            break
        case .error:
            contentView.addSubview(identifyErrorView)
            identifyErrorView.frame = contentView.frame
            break
        case .buggybreak:
            contentView.addSubview(breakView)
            breakView.frame = contentView.frame
            break
        case .upload:
            contentView.addSubview(uploadView)
            uploadView.frame = contentView.frame
            break
        case .success:
            contentView.addSubview(successView)
            successView.frame = contentView.frame
            after(seconds: 1).done {self.dismiss()}
            break
        }
        contentView.bringSubviewToFront(cancelButton)
    }
}

extension ConnectingView:ConnecTimeOutViewDelegate,IdentifyErrorViewDelegate{
    func retryConnect() {
        print("重新连接")
    }
}
extension ConnectingView:BuggyBreakViewDelegate{
    func retryControl() {
        print("重新控制")
    }
}
