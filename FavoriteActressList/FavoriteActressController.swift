//
//  FavoriteActressController.swift
//  FavoriteActressList
//
//  Created by leejungchul on 2021/01/21.
//

import UIKit

class FavoriteActressController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
//    MVVM
//
//    Model
//    - ActressInfo
//    ActressInfo 제작
//
//    View
//    - ListCell
//    ListCell 필요한 정보를 ViewModel에서 받아옴
//    ListCell은 ViewModel에서 받아온 정보로 뷰 업데이트
//
//    ViewModel
//    - ActressViewModel
//    ActressViewModel 제작, 뷰레이어에서 필요한 메서드 만들기
//    Model 가지고 있기, ActressInfo 들
    
    let viewModel = ActressViewModel()
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // detailViewController에 데이터 줌
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            
//            if let index = sender as? Int{
//            }
            guard let index = sender as? Int else { return }
            
            let actressInfo = viewModel.actressInfo(at: index)
            vc?.viewModel.update(model: actressInfo)
        
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // UItableviewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return viewModel.numberOfActressInfoList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        let actressInfo = viewModel.actressInfo(at: indexPath.row)
        cell.update(info: actressInfo)
        
        return cell
    }
    
    //UItableViewDelegate Click event
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("click\(indexPath.row)")
        //modal segue설정하는 부분
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}


class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
    
    func update(info: ActressInfo){
        imgView.image = info.image
        nameLabel.text = info.name
        explanationLabel.text = info.explain
    }
}

class ActressViewModel {
    let actressInfoList: [ActressInfo] = [
        ActressInfo(name: "김고은", explain: "91년생 입니다!"),
        ActressInfo(name: "박보영", explain: "90년생 입니다!"),
        ActressInfo(name: "박은빈", explain: "92년생 입니다!"),
        ActressInfo(name: "신세경", explain: "90년생 입니다!"),
        ActressInfo(name: "김유정", explain: "99년생 입니다!"),
        ActressInfo(name: "박하선", explain: "87년생 입니다!")
    ]
    
    var sortedList: [ActressInfo] {
        let sortedList = actressInfoList.sorted{ prev, next in
            return prev.explain > next.explain
        }
        return sortedList
    }
    
    var numberOfActressInfoList: Int {
        return actressInfoList.count
    }
    
    func actressInfo(at index: Int) -> ActressInfo {
        return sortedList[index]
    }
}
