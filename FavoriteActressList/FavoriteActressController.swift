//
//  FavoriteActressController.swift
//  FavoriteActressList
//
//  Created by leejungchul on 2021/01/21.
//

import UIKit

class FavoriteActressController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let actressList = ["김고은","신세경","박보영","박은빈","김유정","박하선"]
    let explanationList = ["김고은입니다","신세경입니다","박보영입니다","박은빈입니다","김유정입니다","박하선입니다"]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // detailViewController에 데이터 줌
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            
//            if let index = sender as? Int{
//            }
            guard let index = sender as? Int else { return }
            vc?.name = actressList[index]
            vc?.explain = explanationList[index]
        
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // UItableviewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actressList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        let img = UIImage(named: "\(actressList[indexPath.row]).jpg")
        cell.imgView.image = img
        cell.nameLabel.text = actressList[indexPath.row]
        cell.explanationLabel.text = explanationList[indexPath.row]
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    //UItableViewDelegate Click event
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("click\(actressList[indexPath.row])")
        //modal segue설정하는 부분
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}


class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
}
