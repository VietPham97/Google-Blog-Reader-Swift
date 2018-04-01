//
//  DetailViewController.swift
//  Blog Reader
//
//  Created by HoangViet Pham on 2017-11-27.
//  Copyright © 2017 HoangViet Pham. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController, WKNavigationDelegate
{
   let contentKey = "content"
   let titleKey = "title"
   
   var webView: WKWebView!
   
   func configureView()
   {
      // Update the user interface for the detail item.
      if let detail = self.detailItem
      {
         self.title = detail.value(forKey: self.titleKey) as! String
         if let blogWebView = self.webView
         {
            blogWebView.loadHTMLString(detail.value(forKey: contentKey) as! String, baseURL: nil)
         }
      }
   }

   override func loadView() {
      webView = WKWebView()
      webView.navigationDelegate = self
      view = webView
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      configureView()
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }

   var detailItem: Event? {
      didSet {
         // Update the view.
         configureView()
      }
   }


}

