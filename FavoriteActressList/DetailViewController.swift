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
        prepareAnimation()
    }
//    뷰가 나타나는 시점
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAnimation()
        
    }
    
    private func prepareAnimation(){
//        nameLabelCenterX.constant = view.bounds.width
//        explainLabelY.constant = view.bounds.width
        
        // 뷰속성을 이용한 애니메이션 사전 준비
        nameLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        nameLabel.alpha = 0
        
        explainLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        explainLabel.alpha = 0
    }
    
    private func showAnimation(){
//        nameLabelCenterX.constant = 0
//        explainLabelY.constant = 40

//        // 위치변화 에니메이션(튕기는 효과 추가)
//        UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
//            self.view.layoutIfNeeded()
//        }, completion: nil)
        
        // 뷰 속성을 이용한 애니메이션
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            self.nameLabel.transform = CGAffineTransform.identity
            self.nameLabel.alpha = 1
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            self.explainLabel.transform = CGAffineTransform.identity
            self.explainLabel.alpha = 1
        }, completion: nil)
        
        // 회전 애니메이션
        UIView.transition(with: imageView, duration: 0.1, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var explainLabel: UILabel!
    
    @IBOutlet weak var nameLabelCenterX: NSLayoutConstraint!
    @IBOutlet weak var explainLabelY: NSLayoutConstraint!
    
    
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
