//
//  WebViewController.swift
//  Landmark ID
//
//  Created by Pete Chambers on 21/10/2018.
//  Copyright © 2018 Pete Chambers. All rights reserved.
//

import UIKit
import WebKit
import Foundation

class WebViewController: UIViewController, WKNavigationDelegate {
    
    
    // MARK: Properties
    
    var webView: WKWebView!
    var text: String = ""
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    
      // MARK: Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard (text as? String) != nil else {
            print("something went wrong, text can not be cast to String")
            return
        }
        var appendString = String(describing: text.replacingOccurrences(of: " ", with: "_"))
        appendString = appendString.folding(options: .diacriticInsensitive, locale: NSLocale.current)
        if let url = URL(string: "https://en.wikipedia.org/wiki/\(appendString)") {
            webView.load(URLRequest(url: url))
            webView.allowsBackForwardNavigationGestures = true
        } else {
            print("could not open url, it was nil")
        }
        
    }
    
    
}
