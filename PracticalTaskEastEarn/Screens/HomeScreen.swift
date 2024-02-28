//
//  HomeScreen.swift
//  PracticalTaskEastEarn
//
//  Created by Disha on 26/02/24.
//

import UIKit

class HomeScreen: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var homeTableView: UITableView!
    
    //MARK: - VARIABLES
    var fristData: Home?
    var categoryesData: Category?
    var bootmData: Botom?
    var arrSecondData: [MainStickyMenu] = []
    
    //MARK: - METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialDetails()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - FUNCTIONS
    func initialDetails() {
        self.homeTableView.register(UINib(nibName: "HomeCell", bundle: nil), forCellReuseIdentifier: "HomeCell")
//        self.homeTableView.estimatedRowHeight = 150
        self.homeTableView.rowHeight = UITableView.automaticDimension
        self.TopDataAPICalling()
        self.MiddleDataAPICalling()
        self.BotomDataAPICalling()
    }
    
    //MARK: - ACTIONS
    
}
//MARK: - DELEGATE METHODS
extension HomeScreen: UITableViewDelegate, UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCell
        cell.pageControll.isHidden = true
        cell.mainData = self.fristData
        cell.categoryData = self.categoryesData
        cell.bottmData = self.bootmData
        cell.arrTopSecound = self.arrSecondData
        cell.row = indexPath.row
        if indexPath.row == 0 {
            cell.lblTitleLabel.isHidden = true
        }else if indexPath.row == 1 {
            cell.lblTitleLabel.isHidden = true
        }else if indexPath.row == 2 {
            cell.lblTitleLabel.isHidden = false
            cell.lblTitleLabel.text = "Shop By Category"
        }else if indexPath.row == 3 {
            cell.lblTitleLabel.isHidden = false
            cell.lblTitleLabel.text = "Short By Febric Material"
        }else if indexPath.row == 4 {
            cell.lblTitleLabel.isHidden = false
            cell.lblTitleLabel.text = "Unstitched"
        }else if indexPath.row == 5 {
            cell.lblTitleLabel.isHidden = false
            cell.pageControll.isHidden = false
            cell.lblTitleLabel.text = "Boutique Collection"
        }else if indexPath.row == 6 {
            cell.lblTitleLabel.isHidden = false
            cell.lblTitleLabel.text = "Range Of Pattern"
        }else if indexPath.row == 7 {
            cell.lblTitleLabel.isHidden = false
            cell.lblTitleLabel.text = "Design As Per Occasion"
        }
        DispatchQueue.main.async {
            cell.homeCollectionView.reloadData()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return self.view.frame.height / 7.5
        }else if indexPath.row == 1 {
            return self.view.frame.height / 3 + 20
        }else if indexPath.row == 2 {
            return self.view.frame.height / 2.25
        }else if indexPath.row == 3 {
            return self.view.frame.height / 2.5
        }else if indexPath.row == 4 {
            return self.view.frame.height / 1.75
        }else if indexPath.row == 5 {
            return self.view.frame.height / 1.75
        }else if indexPath.row == 6 {
            return self.view.frame.height / 2.5
        }else if indexPath.row == 7 {
            return self.view.frame.height / 1.25
        }else{
            return CGFloat()
        }
    }
}
//MARK: - API CALLING
extension HomeScreen {
    func TopDataAPICalling() {

        guard let gitUrl = URL(string: "http://app-interview.easyglue.in/top_repository.json") else { return }
        print(gitUrl)

        let request = NSMutableURLRequest(url: gitUrl)
        let session = URLSession.shared
        request.httpMethod = "GET"

        let task = session.dataTask(with: request as URLRequest) { data, response, error in

            guard let data = data else { return }
            do {
                let gitData = try JSONDecoder().decode(Home.self, from: data)
                self.fristData = gitData
                self.arrSecondData.removeAll()
                for i in gitData.mainStickyMenu {
                    self.arrSecondData.append(contentsOf: i.sliderImages ?? [])
                }
                print(self.arrSecondData.count)
                DispatchQueue.main.async {
                    self.homeTableView.reloadData()
                }
                print("response data:", gitData)
            } catch let err {
                print("Err", err)
            }
            }.resume()
    }
    func MiddleDataAPICalling() {

        guard let gitUrl = URL(string: "https://app-interview.easyglue.in/middle_repository.json") else { return }
        print(gitUrl)

        let request = NSMutableURLRequest(url: gitUrl)
        let session = URLSession.shared
        request.httpMethod = "GET"

        let task = session.dataTask(with: request as URLRequest) { data, response, error in

            guard let data = data else { return }
            do {
                let gitData = try JSONDecoder().decode(Category.self, from: data)
                self.categoryesData = gitData
                DispatchQueue.main.async {
                    self.homeTableView.reloadData()
                }
                print("response data:", gitData)
            } catch let err {
                print("Err", err)
            }
            }.resume()
    }
    func BotomDataAPICalling() {

        guard let gitUrl = URL(string: "https://app-interview.easyglue.in/bottom_repository.json") else { return }
        print(gitUrl)

        let request = NSMutableURLRequest(url: gitUrl)
        let session = URLSession.shared
        request.httpMethod = "GET"

        let task = session.dataTask(with: request as URLRequest) { data, response, error in

            guard let data = data else { return }
            do {
                let gitData = try JSONDecoder().decode(Botom.self, from: data)
                self.bootmData = gitData
                DispatchQueue.main.async {
                    self.homeTableView.reloadData()
                }
                print("response data:", gitData)
            } catch let err {
                print("Err", err)
            }
            }.resume()
    }
}
