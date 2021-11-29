//
//  TableViewCell.swift
//  orionTelecom
//
//  Created by admin on 11/28/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageVideo: UIImageView!
    
    @IBOutlet weak var videoLabel: UILabel!
    
    
    func config(with id: Int){
                
        let urlString = "https://orionnet.online/api/v2/preview_images/\(id)"
                guard let url = URL(string: urlString)else{
                    return
                }
                
                let task = URLSession.shared.dataTask(with: url) { (data, resp, error) in
                    guard let data = data , error == nil else {
                        return
                    }
                    DispatchQueue.main.async {
                        let image = UIImage(data: data)
                        self.imageVideo.image = image
                    }
                }
                task.resume()
            }
    
}
