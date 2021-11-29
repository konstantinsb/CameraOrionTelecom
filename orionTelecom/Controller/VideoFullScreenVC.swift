//
//  VideoFullScreenVC.swift
//  orionTelecom
//
//  Created by admin on 11/28/21.
//

import UIKit
import AVKit
import AVFoundation
import WebKit

class VideoFullScreenVC: UIViewController {

    @IBOutlet weak var webPlayerView: UIView!
    
    var webPlayer: WKWebView!
    @IBOutlet weak var nameCameraLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    func config(with id: Int){
        let webConfiguration = WKWebViewConfiguration()
               webConfiguration.allowsInlineMediaPlayback = true
                   DispatchQueue.main.async {
                   self.webPlayer = WKWebView(frame: self.webPlayerView.bounds, configuration: webConfiguration)
                   self.webPlayerView.addSubview(self.webPlayer)
                   
                   guard let videoURL = URL(string: "https://krkvideo1.orionnet.online/cam\(id)/embed.html") else { return }
                   let request = URLRequest(url: videoURL)
                   self.webPlayer.load(request)
                   }
        }
}

