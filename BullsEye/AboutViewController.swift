//
//  AboutViewController.swift
//  BullsEye
//
//  Created by laijiaaa1 on 2023/8/28.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

   
    @IBOutlet weak var webview: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html"){
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url:url)
            webview.load(request)
        }
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
