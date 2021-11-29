//
//  ViewController.swift
//  orionTelecom
//
//  Created by admin on 11/28/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    struct VideoData: Codable{
        let id: Int
        let title: String
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    var cameraApi: [VideoData] = []
  
    override func viewDidLoad() {
        super.viewDidLoad()
        responseVideo()
        
    }
  func responseVideo() {
            
            let urlString = "https://orionnet.online/api/v1/cameras/public"
            guard let url = URL(string: urlString) else { return }
           
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print(error)
                       return
                  }
                guard let data = data else {return}
                    do {
                        let json = try JSONDecoder().decode([VideoData].self, from: data)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                            self.cameraApi = json
                    
                    }catch {
                        print(error)
                }
            }.resume()
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cameraApi.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idVideo = cameraApi[indexPath.row].id
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.videoLabel.text = cameraApi[indexPath.row].title
        cell.config(with: idVideo)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        let idVideo = cameraApi[indexPath.row].id
        let vc = storyboard?.instantiateViewController(identifier: "VideoFullScreenVC") as! VideoFullScreenVC
//        vc.nameCameraLabel.text = cameraApi[indexPath.row].title
        vc.config(with: idVideo)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
