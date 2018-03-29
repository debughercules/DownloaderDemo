//
//  ViewController.swift
//  DownloaderDemo
//
//  Created by bharat byan on 29/03/18.
//  Copyright © 2018 bharat byan. All rights reserved.
//

import UIKit
import ARSLineProgress

class ViewController: UIViewController {
  
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        let _ = DownloadManager.shared.activate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DownloadManager.shared.onProgress = { (progress) in
            OperationQueue.main.addOperation {
                self.progressView.progress = progress
            }
        }
        
//        if ARSLineProgress.shown { return }
//
//        ARSLineProgress.showWithPresentCompetionBlock { () -> Void in
//            print("Showed with completion block")
//        }
//
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(3 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: { () -> Void in
//            ARSLineProgress.hideWithCompletionBlock({ () -> Void in
//                print("Hidden with completion block")
//            })
//        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        DownloadManager.shared.onProgress = nil
    }
    
    @IBAction func startDownload(_ sender: Any) {
        //        let url = URL(string: "https://scholar.princeton.edu/sites/default/files/oversize_pdf_test_0.pdf")!
        let url = URL(string: "https://github.com/sqlitebrowser/sqlitebrowser/releases/download/v3.10.1/DB.Browser.for.SQLite-3.10.1.dmg")!
        let task = DownloadManager.shared.activate().downloadTask(with: url)
        task.resume()
    }


}

