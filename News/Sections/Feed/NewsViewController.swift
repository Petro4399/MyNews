//
//  ViewController.swift
//  News
//
//  Created by Petro Starychok on 17.02.2021.
//

import UIKit

class newsViewController: UIViewController, UITableViewDataSource {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var fetchedNews = [NewsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        
        downloadJson()
    }
    
    func downloadJson(){
        NewsService.getNews {[weak self] (news) in
            self?.fetchedNews = news ?? []
            self?.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as? NewsCell else { return UITableViewCell()}
        
        let item = fetchedNews[indexPath.row]
        cell.setup(item)
        
        return cell
    }
    
}

