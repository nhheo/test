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
        
//        let request = URLRequest(url: URL(string: "https://www.google.com")!)
//        webview.load(request)
        
//        let html = """
//        <html>
//        <body>
//        <h1>Hello, Swift!</h1>
//        </body>
//        </html>
//        
//        public static String getString(JSON json) throws JSONException {
//            return json.toString();
//        }
//        """
//        
//        webview.loadHTMLString(html, baseURL: nil)
//        
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+3) {
//            //let json = self.makeData()
//            let jsonString: String = self.makeData()
//            webview.evaluateJavaScript("getString(" + jsonString + ")") { result, Error in
//                
//            }
//        }
    }
    
    func makejavafunc() {
        let jsonFunc =
                    """
                    ;(function() {
                        function getString(JSON json) throws JSONException {
                         messageHandlers[handlerName] = handler;
                        }
                    }
                    """
    }
    
    
    func makeData() -> [String:Any]? {
        var nam = nams()
        nam.s1 = "test1"
        nam.s2 = "test2"
        
        for _ in 0 ..< 2 {
            var dal = dal()
            dal.d1 = "test3"
            dal.d2 = "test4"
            nam.dals.append(dal)
        }
        
        do {
            let jsonData = try JSONEncoder().encode(nam)
            let json = try JSONSerialization.jsonObject(with: jsonData) as? [String:Any]
            return json
        } catch {
            
        }
        
        return nil
    }
    
    func makeData() -> String {
        var nam = nams()
        nam.s1 = "test1"
        nam.s2 = "test2"
        
        for _ in 0 ..< 2 {
            var dal = dal()
            dal.d1 = "test3"
            dal.d2 = "test4"
            nam.dals.append(dal)
        }
        
        do {
            let jsonData = try JSONEncoder().encode(nam)
            let jsonString = String(data: jsonData, encoding: .utf8)
            //let json = try JSONSerialization.jsonObject(with: jsonData) as? [String:Any]
            return jsonString ?? ""
        } catch {
            
        }
        
        return ""
    }

<<<<<<< HEAD
    // rebase - test2
=======
}

struct nams: Codable {
    var s1 = ""
    var s2 = ""
    var dals = [dal]()
>>>>>>> 39eaee9 (test4)
}

struct dal: Codable {
    var d1 = ""
    var d2 = ""
}

struct rani: Codable {
    var r1 = ""
    var r2 = ""
}
