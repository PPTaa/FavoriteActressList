//
//  DetailViewController.swift
//  FavoriteActressList
//
//  Created by leejungchul on 2021/02/15.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var explainLabel: UILabel!
    
    var name: String?
    var explain: String?
    
    func updateUI() {
        if let name = self.name, let explain = self.explain{
            let image = UIImage(named: "\(name).jpg")
            imageView.image = image
            nameLabel.text = name
            explainLabel.text = "\(explain)"

        }
    }

}
