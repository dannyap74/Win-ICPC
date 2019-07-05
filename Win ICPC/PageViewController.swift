//
//  PageViewController.swift
//  Win ICPC
//
//  Created by Даниил Палеев on 04/07/2019.
//  Copyright © 2019 Даниил Палеев. All rights reserved.
//

import UIKit

class PageViewController: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var describtion: UILabel!
    //@IBOutlet weak var checkButton: UIButton!
    
    var d: Subtheme?
    
    func initViewp(data:Subtheme){
        d = data
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = d?.name
        describtion.text = d?.description
        /*if d?.solved ?? false{
            checkButton.setTitle("Тема пройдена", for: .normal)
        }
        else{
            checkButton.setTitle("Тема не пройдена", for: .normal)
        }*/
        tableView.dataSource = self
        tableView.delegate = self
    }
    /*@IBAction func butPressed(_ sender: Any) {
        if d?.solved == false{
            d?.resolve()
            checkButton.setTitle("Тема пройдена", for: .normal)
        }
        else{
            d?.unsolve()
            checkButton.setTitle("Тема не пройдена", for: .normal)
        }
    }*/
    
}

extension PageViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var n = 0
        if d?.tasks != nil{
            n += 1
        }
        if d?.material != nil{
            n += d?.material?.count ?? 0
        }
        return n
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MaterialTableViewCell", for: indexPath) as? MaterialTableViewCell else {
            fatalError("Can not dequeue reusable cell ")
        }
        var s = ""
        if (d?.tasks == nil && d?.material != nil){
            s = d?.material?[indexPath.row].0 ?? ""
        }
        if (d?.tasks != nil && d?.material == nil){
            s = "Задачи на \(d?.name)"
        }
        if (d?.tasks != nil && d?.material != nil){
            if indexPath.row < d?.material?.count ?? 0{
                s = d?.material?[indexPath.row].0 ?? ""
            }
            else{
                s = "Задачи на \(d!.name)"
            }
        }
        cell.initWith(s: s)
        return cell
    }
    
    
}

extension PageViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var s = ""
        if (d?.tasks == nil && d?.material != nil){
            s = d?.material?[indexPath.row].1 ?? ""
        }
        if (d?.tasks != nil && d?.material == nil){
            s = d?.tasks?.1 ?? ""
        }
        if (d?.tasks != nil && d?.material != nil){
            if indexPath.row < d?.material?.count ?? 0{
                s = d?.material?[indexPath.row].1 ?? ""
            }
            else{
                s = d?.tasks?.1 ?? ""
            }
        }
        guard let url = URL(string: s) else { return }
        UIApplication.shared.open(url)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
