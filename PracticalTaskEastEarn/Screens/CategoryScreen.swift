//
//  CategoryScreen.swift
//  PracticalTaskEastEarn
//
//  Created by Disha on 26/02/24.
//

import UIKit
import SDWebImage

class CategoryScreen: UIViewController {
    
    //MARK: - OUTLETS
    @IBOutlet weak var categoryTableView: UITableView!
    //MARK: - VARIABLES
    var arrCategory: [ChildCategory] = []
    var bannerImage: String = ""
    //MARK: - METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialDetails()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - FUNCTIONS
    func initialDetails() {
        self.categoryTableView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellReuseIdentifier: "CategoryCell")
        self.CategoryDataAPICalling()
    }
    //MARK: - ACTIONS

}
//MARK: - DELEGATE METHODS
extension CategoryScreen: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrCategory.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if arrCategory[section].isExpand == true {
            return arrCategory[section].child?.count ?? 0
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            cell.cattitle.text = arrCategory[indexPath.section].categoryName
            if arrCategory[indexPath.section].isExpand == true {
                cell.downImageView.image = UIImage(named: "upload")
            }else{
                cell.downImageView.image = UIImage(named: "down-arrow")
            }
            cell.catImage.sd_setImage(with: URL(string: self.bannerImage), placeholderImage: UIImage(named: "upload"))
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            cell.cattitle.text = arrCategory[indexPath.section].child?[indexPath.row].categoryName
            cell.downImageView.isHidden = true
            cell.catImage.sd_setImage(with: URL(string: self.bannerImage), placeholderImage: UIImage(named: "upload"))
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.arrCategory[indexPath.section].isExpand = !self.arrCategory[indexPath.section].isExpand
            self.categoryTableView.reloadSections([indexPath.section], with: .automatic)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height / 6
    }
}
//MARK: - API CALLING
extension CategoryScreen {
    func CategoryDataAPICalling() {

        guard let gitUrl = URL(string: "https://app-interview.easyglue.in/category_repository.json") else { return }
        print(gitUrl)

        let request = NSMutableURLRequest(url: gitUrl)
        let session = URLSession.shared
        request.httpMethod = "GET"

        let task = session.dataTask(with: request as URLRequest) { data, response, error in

            guard let data = data else { return }
            do {
                let gitData = try JSONDecoder().decode(SetCategory.self, from: data)
                self.arrCategory = gitData.categories
                self.bannerImage = gitData.bannerImage
                DispatchQueue.main.async {
                    self.categoryTableView.reloadData()
                }
                print("response data:", gitData)
            } catch let err {
                print("Err", err)
            }
            }.resume()
    }
}
