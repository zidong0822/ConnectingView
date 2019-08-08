//
//  ViewController.swift
//  ConnectingView
//
//  Created by Harvey He on 2019/3/7.
//  Copyright © 2019 Harvey He. All rights reserved.
//

import UIKit
import PromiseKit
import Pulsator
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        after(seconds: 2).done {_ in 
            ConnectingView.getInstance().show()
        }
        
        after(seconds:4).done {
             ConnectingView.getInstance().changeStatus(type:.check)
        }
        
        after(seconds: 6).done {
             ConnectingView.getInstance().changeStatus(type: .error)
        }
        
        after(seconds: 8).done {
             ConnectingView.getInstance().changeStatus(type: .buggybreak)
        }
        
        after(seconds: 10).done {
             ConnectingView.getInstance().changeStatus(type:.timeout)
        }
        
        after(seconds:12).done {
             ConnectingView.getInstance().changeStatus(type:.upload)
        }
        
        after(seconds: 15).done {
             ConnectingView.getInstance().changeStatus(type:.success)
        }
        
        
    }
    
    
}

