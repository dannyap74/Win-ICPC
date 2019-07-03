//
//  ViewController.swift
//  Win ICPC
//
//  Created by Даниил Палеев on 02/07/2019.
//  Copyright © 2019 Даниил Палеев. All rights reserved.
//

import UIKit

struct Theme {
    var name: String
    var subthemes = [Subtheme]()
    init(name: String, subt : [Subtheme]) {
        self.name = name
        subthemes = subt
    }
    func level() -> (Int, Int) {
        var lev = 0
        var all = 0
        for elem in subthemes {
            lev += elem.level().0
            all += elem.level().1
            
        }
        return (lev, all) // возвращает количество решенных задач и общее количество задач
    }
}

struct Subtheme {
    var description: String
    var name: String
    var stateOfTheme = -1
    var material = [(String, String)]() // Массив с парами "Ресурс" - "Ссылка"
    var tasks = [String: Int]() // Словарь с парами "Ссылка на задачи" - "Состояние задач"
    
    init(name: String, description: String, material: [(String, String)], tasks: [String]) {
        self.name = name
        self.description = description
        self.material = material
        for elem in tasks {
            self.tasks[elem] = -1
        }
    }
    
    mutating func readTheme() {
        if self.level().0 == self.level().1 {
            stateOfTheme = 1
        }
        stateOfTheme = 0 // Если тема прочитана, ее состояние 0
    }
    
    mutating func readTask(task: String) {
        tasks[task] = 0 // Если задача прочитана, ее состояние 0
    }
    
    mutating func resolveTask(task: String) {
        tasks[task] = 1 // Если задача решена, ее состояние 1
    }
    
    func level() -> (Int, Int) {
        var lev = 0
        for elem in tasks {
            if elem.value == 1 {
                lev += 1
            }
            
        }
        return (lev, tasks.count) // возвращает количество решенных задач и общее количество задач
    }
}

var arrTheme: [Theme] = [
    Theme(name: "Структуры данных", subt: [
        Subtheme(
            name: "Стек",
            description: "Стеком (англ. – stack) называется структура данных, в которой элементы хранятся в виде последовательности, при этом работать можно только с одним элементом — который был последним добавлен в стек.",
            material: [("FOXFORD", "https://foxford.ru/wiki/informatika/stek"),
                       ("HABRAHABR", "http://habrahabr.ru/post/113585/"),
                       ("HARDFIRE", "http://hardfire.ru/stack_min")],
            tasks: ["https://informatics.mccme.ru/py-source/source/dir/240-362"]
        ),
        Subtheme(
            name: "Дек",
            description: "Дек - структура данных, выполняющая быстрое удаление/вставку первого и последнего элемента.",
            material: [("HABRAHABR", "http://habrahabr.ru/post/200560/"),
                       ("HARDFIRE", "http://hardfire.ru/deque")],
            tasks: ["https://informatics.mccme.ru/py-source/source/dir/240-363"]
        )
        ]),
    Theme(name: "Динамическое програмирование", subt: [
        Subtheme(
            name: "Игры и выигрышные стратегии",
            description: "Требуется для заданной начальной позиции определить, кто выиграет при оптимальной игре обоих игроков (или определить, что результатом будет ничья). Мы решим эту задачу очень эффективно - найдём ответы для всех вершин графа за линейное относительно количества рёбер время",
            material: [("E-MAXX", "http://e-maxx.ru/algo/games_on_graphs")],
            tasks: ["http://informatics.mccme.ru/py-source/source/dir/240-396"]
        ),
        Subtheme(
            name: "Одномерное динамическое \nпрограммирование",
            description: "Динамическое программирование на одномерных массивах",
            material: [("FOXFORD", "http://foxford.ru/wiki/informatika/odnomernoe-dinamicheskoe-programmirovanie-nailuchshiy-sposob"),
                       ("FOXFORD", "http://foxford.ru/wiki/informatika/odnomernoe-dinamicheskoe-programmirovanie-kolichestvo-sposobov"),
                       ("SIS.VIDEO", "http://sis.khashaev.ru/2013/august/c-prime/38WrqoMIGdk/"),
                       ("SIS.VIDEO", "http://sis.khashaev.ru/2013/august/c-prime/Rh9RHwH5Vj8/"),
                       ("HABRAHABR", "http://habrahabr.ru/post/191498/")],
            tasks: ["http://informatics.mccme.ru/py-source/source/dir/240-397"]
        )
        ]),
    Theme(name: "Графы", subt: [
        Subtheme(
            name: "Хранение графа",
            description: "Определения всех базовых понятий, необходимых для работы с графами",
            material: [("FOXFORD", "http://foxford.ru/wiki/informatika/hranenie-grafa-spiski-smezhnyh-vershin"),
                       ("FOXFORD", "http://foxford.ru/wiki/informatika/hranenie-grafa-spisok-reber"),
                       ("FOXFORD", "http://foxford.ru/wiki/informatika/hranenie-grafa-matritsa-smezhnosti"),
                       ("PYTHONTUTOR", "http://pythontutor.ru/lessons/graphs/")],
            tasks: ["http://informatics.mccme.ru/py-source/source/dir/240-388"]
        ),
        Subtheme(
            name: "Поиск в глубину",
            description: "Алгоритм обхода графа",
            material: [("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/aX2vxp4NeqI/"),
                       ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/oWc-uhuH0oo/"),
                       ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/xZdaTdiidkk/"),
                       ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/EJJ3eqOcHe8/"),
                       ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/NzFUZRNA3n8/"),
                       ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/yPnelTAnZNE/"),
                       ("E-maxx", "http://e-maxx.ru/algo/dfs"),
                       ("Foxford", "http://foxford.ru/wiki/informatika/algoritm-poiska-v-glubinu"),
                       ("E-maxx", "http://e-maxx.ru/algo/connected_components"),
                       ("Habrahabr", "http://habrahabr.ru/post/200074/"),
                       ("Pythontutor", "http://pythontutor.ru/lessons/dfs/")],
            tasks: ["http://informatics.mccme.ru/py-source/source/dir/240-387"]
        )
        ])
]

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTheme.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ThemeTableViewCell", for: indexPath) as? ThemeTableViewCell else {
            fatalError("Can not dequeue reusable cell ")
        }
        let item = arrTheme[indexPath.row]
        cell.initWith(item: item)
        return cell
    }
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "subThemeList") as! SubThemeViewController
        newView.initView(data: arrTheme[indexPath.row])
        show(newView, sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

