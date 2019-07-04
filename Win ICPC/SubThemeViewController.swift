//
//  SubThemeViewController.swift
//  Win ICPC
//
//  Created by Даниил Палеев on 03/07/2019.
//  Copyright © 2019 Даниил Палеев. All rights reserved.
//

import UIKit

class SubThemeViewController: UITableViewController {
    var d: Theme?
    
    func initView(data: Theme){
        d = data
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = d?.name
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
}

extension SubThemeViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return d?.subthemes.count ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SubthemeTableViewCell", for: indexPath) as? SubthemeTableViewCell else {
            fatalError("Can not dequeue reusable cell ")
        }
        let item = d!.subthemes[indexPath.row]
        cell.initWith(item: item)
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "page") as! PageViewController
        newView.initViewp(data: d!.subthemes[indexPath.row])
        show(newView, sender: nil)
    }
}

