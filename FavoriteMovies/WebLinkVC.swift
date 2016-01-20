//
//  WebLinkVC.swift
//  FavoriteMovies
//
//  Created by Sun Chung on 1/19/16.
//  Copyright © 2016 anseha. All rights reserved.
//

import UIKit
import WebKit

class WebLinkVC: UIViewController {

    //var webView : UIWebView?
    var urlLink : String?
    
    @IBOutlet weak var webBrowser : UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let url = NSURL(string: urlLink!)
        let request = NSURLRequest(URL: url!)
        webBrowser.loadRequest(request)
        self.navigationItem.title = "IMDB Web"
        
    }

}
