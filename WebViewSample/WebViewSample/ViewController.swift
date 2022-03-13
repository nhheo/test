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
        
        var strJson = "{\"a\":\"테스트\n합니다.\"}"
        strJson = strJson.replacingOccurrences(of: "\n", with: "\\n")
        let json = try? JSONSerialization.jsonObject(with: strJson.data(using: .utf8)!, options: [])
        
        //let 
//        guard let responseData = try? JSONSerialization.jsonObject(with: data, options: []) else {
//            isError = true
//            errorMessage = "fail to convert json to array"
//            YYLoadingBar.sharedLoadingBar.hide()

        
    }
    
    func initUI() {
        //let config = WKWindowFeatures()
        let config = WKWebViewConfiguration()
111
        
        //let bridgeCall = makejavafunc()
        let bridgeCall = makejavafunc()
        let bridgeScript = WKUserScript.init(source: bridgeCall, injectionTime: WKUserScriptInjectionTime.atDocumentStart, forMainFrameOnly: false)
        
        config.userContentController.addUserScript(bridgeScript)
        config.preferences.javaScriptCanOpenWindowsAutomatically = true;

        let webview = WKWebView(frame: view.frame, configuration: config)
        view.addSubview(webview)
        
//        let request = URLRequest(url: URL(string: "https://www.google.com")!)
//        webview.load(request)
        
        let html = """
        <html>
        <head>
        <script type="text/javascript">
            function getString() {
                alert("func() head 호출");
            }
            // onclick은 태그 클릭할때의 이벤트
            // 자바스크립트는  1.head 2.body
            // 안에서 실행할 수 있다
            // 또한 외부 파일도 불러와서 실행할 수 있다(js파일)
        </script>
        </head>
        <body>
        <h1>Hello, Swift!</h1>
        </body>
        </html>
        """
        
        webview.loadHTMLString(html, baseURL: nil)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+3) {
            //let json = self.makeData()
            let jsonString: String = self.makeData()
            webview.evaluateJavaScript("getString()") { result, Error in
                
            }
//            webview.evaluateJavaScript("getString(" + jsonString + ")") { result, Error in
//
//            }
        }
    }
    
    func makejavafunc() -> String {
        let jsonFunc =
                    """
                    ;(function() {
                        function getString(JSON json) throws JSONException {
                            return json.toString();
                        }
                    }
                    """
        return jsonFunc
    }
    
    
    func makeData() -> [String:Any]? {
        var nam = nams()
        nam.s1 = "test1"
        nam.s2 = "test2"
        
        for _ in 0 ..< 2 {
            var dd = dal()
            dd.d1 = "test3"
            dd.d2 = "test4"
            nam.dals.append(dd)
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
            var dd = dal()
            dd.d1 = "test3"
            dd.d2 = "test4"
            nam.dals.append(dd)
        }
        
        do {
            let jsonData = try JSONEncoder().encode(nam)
            let jsonString = String(data: jsonData, encoding: .utf8)
            //let json = try JSONSerialization.jsonObject(with: jsonData) as? [String:Any]
            return jsonString ?? ""
        } catch {
            
        }
        
        return "1234"
    }
    
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        NSLog(message)
    }
    // rebase - test2
}

struct nams: Codable {
    var s1 = ""
    var s2 = ""
    var dals = [dal]()
}

struct dal: Codable {
    var d1 = ""
    var d2 = ""
}

struct rani: Codable {
    var r1 = ""
    var r2 = ""
}
