//
//  MainPresenter.swift
//  orionTelecom
//
//  Created by admin on 11/29/21.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func setGreeting(greering: String)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, videoFetch: VideoFetch)
    func showGreeting()
}

class MainPresenter: MainViewPresenterProtocol {
    let view: MainViewProtocol
    let videoFetch: VideoFetch
    
    required init(view: MainViewProtocol, videoFetch: VideoFetch) {
        self.view = view
        self.videoFetch = videoFetch
    }
    
    func showGreeting() {
        let greeting = videoFetch.lastName + " " + videoFetch.lastName
        view.setGreeting(greering: greeting)
    }
}
