//
//  ViewController.swift
//  WebViewSample
//
//  Created by nhheo on 2021/12/05.
//

import UIKit
import WebKit


class ViewController: UIViewController, WKUIDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    func initUI() {
        let webview = WKWebView(frame: view.frame)
        view.addSubview(webview)
        
        let request = URLRequest(url: URL(string: "https://www.naver.com")!)
        webview.load(request)
    }
    


}

