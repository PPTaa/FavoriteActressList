//
//  DetailViewController.swift
//  FavoriteActressList
//
//  Created by leejungchul on 2021/02/15.
//

import UIKit

class DetailViewController: UIViewController {
    
    
//    MVVM
//
//    Model
//    - ActressInfo
//    ActressInfo 제작
//
//    View
//    - imageView, nameLabel, explainLabel
//    view 들은 viewModel을 통해서 구성하ㄱ
//
//    ViewModel
//    - DetailViewModel
//    뷰레이어에서 필요한 메서드 만들기
//    Model 가지고 있기, ActressInfo 들

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
    
    
    let viewModel = DetailViewModel()
    
    func updateUI() {
        
        if let actressInfo = self.viewModel.actressInfo {
            imageView.image = actressInfo.image
            nameLabel.text = actressInfo.name
            explainLabel.text = actressInfo.explain
        }
    }

}
class DetailViewModel {
    var actressInfo: ActressInfo?
    
    func update(model: ActressInfo?){
        actressInfo = model
    }
}
