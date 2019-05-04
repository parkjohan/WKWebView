//
//  ViewController.swift
//  WKWebView Project
//
//  Created by Johan Park on 5/2/19.
//  Copyright © 2019 Johan Park. All rights reserved.
//

import UIKit

//import WebKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    //create a property of type WKWebView!
    var webView: WKWebView!
    
    //loadView() func
    override func loadView() {
        //create an instance of WKWebView()
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: "https://www.apple.com") else { return }
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(openTapped))

        
    }
    
    //create actionSheet UIAlertActionController for bar button drop down
    @objc func openTapped() {
        let alert = UIAlertController(title: "Open", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Google.com", style: .default, handler: openPage))
        alert.addAction(UIAlertAction(title: "Apple.com", style: .default, handler: openPage))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(alert, animated: true)
    }
    
    //handlers for each UIAlertAction
    func openPage(action: UIAlertAction) {
        guard let actionTitle = action.title else { return }
        guard let url = URL(string: "https://+\(actionTitle)") else { return }
        webView.load(URLRequest(url: url))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }

}

