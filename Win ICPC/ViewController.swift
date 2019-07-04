//
//  ViewController.swift
//  Win ICPC
//
//  Created by Даниил Палеев on 02/07/2019.
//  Copyright © 2019 Даниил Палеев. All rights reserved.
//

import UIKit

let defaults = UserDefaults.standard

struct Theme {
    var name: String
    var subthemes = [Subtheme]()
    init(name: String, subt : [Subtheme]) {
        self.name = name
        subthemes = subt
    }
    func level() -> (Int, Int) {
        var lev = 0
        for elem in subthemes {
            if elem.solved == true{
                lev += 1
            }
        }
        return (lev, subthemes.count) // возвращает количество решенных задач и общее количество задач
    }
}

struct Subtheme {
    var description: String
    var name: String
    var material: [(String, String)]? // Массив с парами "Ресурс" - "Ссылка"
    var tasks: (String, String)?// Словарь с парами "Ссылка на задачи" - "Состояние задач"
    var solved: Bool
    
    init(name: String, description: String, material: [(String, String)]?, tasks: (String, String)?) {
        self.name = name
        self.description = description
        self.material = material
        self.tasks = tasks
        self.solved = defaults.bool(forKey: self.name) 
    }
    mutating func resolve() {
        defaults.set(true, forKey: self.name)
        self.solved = true
    }
    mutating func unsolve() {
        defaults.set(false, forKey: self.name)
        self.solved = false
    }
    
}

var arrTheme: [Theme] = [
    Theme(name: "Прочее", subt: [Subtheme(
        
        name: "Разбор выражений",
        
        description: "nil",
        
        material: [("E-maxx", "http://e-maxx.ru/algo/expressions_parsing"), ("Foxford", "http://foxford.ru/wiki/informatika/obratnaya-polskaya-notatsiya")],
        
        tasks: nil),
                                       
                                       Subtheme(
                                        
                                        name: "Регулярные выражения",
                                        
                                        description: "nil",
                                        
                                        material: [("Habrahabr", "http://habrahabr.ru/post/115825/")],
                                        
                                        tasks: nil),
                                       
                                       Subtheme(
                                        
                                        name: "Конечные автоматы",
                                        
                                        description: "nil",
                                        
                                        material: [("Habrahabr", "http://habrahabr.ru/post/141503/")],
                                        
                                        tasks: nil),
                                       
                                       Subtheme(
                                        
                                        name: "Поиск подстроки в строке",
                                        
                                        description: "nil",
                                        
                                        material: [("Habrahabr", "http://habrahabr.ru/post/113266/")],
                                        
                                        tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-434")),
                                       
                                       ]),
    
    Theme(name: "Структуры данных", subt: [
        
        Subtheme(
            
            name: "Система независимых множеств",
            
            description: "nil",
            
            material: [("Habrahabr", "http://habrahabr.ru/post/104772/"), ("E-maxx", "http://e-maxx.ru/algo/mst_kruskal_with_dsu"), ("E-maxx", "http://e-maxx.ru/algo/dsu")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-428")),
        
        Subtheme(
            
            name: "Сортировка кучей",
            
            description: "nil",
            
            material: [("Habrahabr", "http://habrahabr.ru/post/112222/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-350")),
        
        Subtheme(
            
            name: "Очередь с приоритетами",
            
            description: "nil",
            
            material: [("HardFire", "http://hardfire.ru/heap")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-350")),
        
        Subtheme(
            
            name: "Частичные суммы",
            
            description: "nil",
            
            material: nil,
            
            tasks: nil),
        
        Subtheme(
            
            name: "Корневая декомпозиция",
            
            description: "nil",
            
            material: nil,
            
            tasks: nil),
        
        Subtheme(
            
            name: "Разреженные таблицы",
            
            description: "nil",
            
            material: nil,
            
            tasks: nil),
        
        Subtheme(
            
            name: "Дерево отрезков",
            
            description: "nil",
            
            material: [("Habrahabr", "http://habrahabr.ru/post/115026/"), ("E-maxx", "http://e-maxx.ru/algo/segment_tree"), ("SIS.Video", "http://sis.khashaev.ru/2013/july/a/mnpAaPpLP7U/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-420")),
        
        Subtheme(
            
            name: "Куча",
            
            description: "nil",
            
            material: [("Foxford", "http://foxford.ru/wiki/informatika/kucha-heap"), ("Habrahabr", "http://habrahabr.ru/post/112222/"), ("E-maxx", "http://e-maxx.ru/algo/randomized_heap")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-350")),
        
        Subtheme(
            
            name: "Дерево поиска",
            
            description: "nil",
            
            material: [("Habrahabr", "http://habrahabr.ru/post/145388/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-419")),
        
        Subtheme(
            
            name: "Декартово дерево",
            
            description: "nil",
            
            material: [("E-maxx", "http://e-maxx.ru/algo/treap"), ("Habrahabr", "https://habrahabr.ru/post/101818/")],
            
            tasks: nil),
        
        Subtheme(
            
            name: "Декартово дерево по неявному ключу",
            
            description: "nil",
            
            material: [("Habrahabr", "https://habrahabr.ru/post/102364/")],
            
            tasks: nil),
        
        Subtheme(
            
            name: "Множества и словари",
            
            description: "nil",
            
            material: nil,
            
            tasks: nil),
        
        Subtheme(
            
            name: "Связный список",
            
            description: "nil",
            
            material: [("Habrahabr", "http://habrahabr.ru/post/247053/"), ("HardFire", "http://hardfire.ru/list")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-439")),
        
        Subtheme(
            
            name: "Дек",
            
            description: "nil",
            
            material: [("HardFire", "http://hardfire.ru/deque"), ("Habrahabr", "http://habrahabr.ru/post/200560/"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/DgGSq4IKOA4/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-363")),
        
        Subtheme(
            
            name: "Очередь",
            
            description: "nil",
            
            material: [("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/NBHz-g-OVwg/"), ("Foxford", "http://foxford.ru/wiki/informatika/ochered"), ("Foxford", "http://foxford.ru/wiki/informatika/ochered-na-python"), ("HardFire", "http://hardfire.ru/queue_min"), ("Pythontutor", "http://pythontutor.ru/lessons/queue/"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/fdRbuT-tLYA/"), ("Habrahabr", "http://habrahabr.ru/post/113585/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-361")),
        
        Subtheme(
            
            name: "Стек",
            
            description: "Абстрактный тип данных, представляющий собой список элементов, организованных по принципу LIFO (англ. last in — first out, «последним пришёл — первым вышел»).",
            
            material: [("Habrahabr", "http://habrahabr.ru/post/113585/"), ("Foxford", "http://foxford.ru/wiki/informatika/stek"), ("HardFire", "http://hardfire.ru/stack_min")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-362")),
        
        ]),
    
    Theme(name: "Динамическое программирование", subt: [
        
        Subtheme(
            
            name: "ДП по изломанному профилю",
            
            description: "nil",
            
            material: [("Habrahabr", "http://habrahabr.ru/post/191498/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-426")),
        
        Subtheme(
            
            name: "ДП по профилю",
            
            description: "nil",
            
            material: [("E-maxx", "http://e-maxx.ru/algo/profile_dynamics"), ("Habrahabr", "http://habrahabr.ru/post/191498/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-426")),
        
        Subtheme(
            
            name: "ДП по подмножествам",
            
            description: "nil",
            
            material: [("Habrahabr", "http://habrahabr.ru/post/191498/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-447")),
        
        Subtheme(
            
            name: "ДП по подотрезкам",
            
            description: "nil",
            
            material: [("Habrahabr", "http://habrahabr.ru/post/112386/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-400")),
        
        Subtheme(
            
            name: "ДП на деревьях",
            
            description: "nil",
            
            material: [("Habrahabr", "http://habrahabr.ru/post/191498/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-425")),
        
        Subtheme(
            
            name: "Задача о рюкзаке",
            
            description: "nil",
            
            material: [("Foxford", "http://foxford.ru/wiki/informatika/algoritm-ukladki-ryukzaka")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-413")),
        
        Subtheme(
            
            name: "ДП с двумя параметрами",
            
            description: "nil",
            
            material: [("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/KQcyVlXYnGA/"), ("Habrahabr", "http://habrahabr.ru/post/191498/"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/uUVwRJcTbU4/"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/0BtGJkm84Ow/"), ("Foxford", "http://foxford.ru/wiki/informatika/dvumernoe-dinamicheskoe-programmirovanie-tablitsy"), ("Foxford", "http://foxford.ru/wiki/informatika/naibolshaya-obschaya-podposledovatelnost"), ("E-maxx", "http://e-maxx.ru/algo/longest_increasing_subseq_log")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-401")),
        
        Subtheme(
            
            name: "Теория расписаний",
            
            description: "nil",
            
            material: nil,
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-18213")),
        
        Subtheme(
            
            name: "ДП на таблицах",
            
            description: "nil",
            
            material: [("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/87h-mqcg1-A/"), ("Habrahabr", "http://habrahabr.ru/post/191498/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-399")),
        
        Subtheme(
            
            name: "Одномерное ДП",
            
            description: "nil",
            
            material: [("Foxford", "http://foxford.ru/wiki/informatika/odnomernoe-dinamicheskoe-programmirovanie-kolichestvo-sposobov"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/38WrqoMIGdk/"), ("Foxford", "http://foxford.ru/wiki/informatika/odnomernoe-dinamicheskoe-programmirovanie-nailuchshiy-sposob"), ("Habrahabr", "http://habrahabr.ru/post/191498/"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/Rh9RHwH5Vj8/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-397")),
        
        Subtheme(
            
            name: "Жадные алгоритмы",
            
            description: "nil",
            
            material: nil,
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-427")),
        
        Subtheme(
            
            name: "Восстановление ответа в ДП",
            
            description: "nil",
            
            material: nil,
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-351")),
        
        Subtheme(
            
            name: "ДП в играх",
            
            description: "nil",
            
            material: [("Foxford", "http://foxford.ru/wiki/informatika/dvumernoe-dinamicheskoe-programmirovanie-igry")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-415")),
        
        Subtheme(
            
            name: "Игры и выигрышные стратегии",
            
            description: "nil",
            
            material: [("E-maxx", "http://e-maxx.ru/algo/games_on_graphs")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-396")),
        
        ]),
    
    Theme(name: "Числа", subt: [
        
        Subtheme(
            
            name: "Остатки",
            
            description: "nil",
            
            material: [("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/BIwzyPBgU6Y/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-433")),
        
        Subtheme(
            
            name: "Быстрое преобразование Фурье",
            
            description: "nil",
            
            material: [("Habrahabr", "http://habrahabr.ru/post/113642/"), ("E-maxx", "http://e-maxx.ru/algo/fft_multiply")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-16152")),
        
        Subtheme(
            
            name: "Системы счисления",
            
            description: "nil",
            
            material: [("Foxford", "http://foxford.ru/wiki/informatika/dvoichnaya-sistema-schisleniya"), ("Foxford", "http://foxford.ru/wiki/informatika/perevod-dvoichnyh-chisel-v-drugie-sistemy-schisleniya"), ("Foxford", "http://foxford.ru/wiki/informatika/operatsii-v-pozitsionnyh-sistemah-schisleniya"), ("Habrahabr", "http://habrahabr.ru/post/124395/"), ("Foxford", "http://foxford.ru/wiki/informatika/pozitsionnye-sistemy-schisleniya"), ("Foxford", "http://foxford.ru/wiki/informatika/slozhenie-vychitanie-i-umnozhenie-dvoichnyh-chisel")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-357")),
        
        Subtheme(
            
            name: "&quot;Длинная&quot; арифметика",
            
            description: "nil",
            
            material: [("Habrahabr", "http://habrahabr.ru/post/172285/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-383")),
        
        Subtheme(
            
            name: "Быстрое возведение в степень",
            
            description: "nil",
            
            material: [("Habrahabr", "http://habrahabr.ru/post/205318/"), ("E-maxx", "http://e-maxx.ru/algo/binary_pow")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-455")),
        
        Subtheme(
            
            name: "Алгоритм Евклида",
            
            description: "nil",
            
            material: [("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/lwUfAa0eCdo/"), ("Foxford", "http://foxford.ru/wiki/informatika/algoritm-evklida-python"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/2MBSsJ0TEMg/"), ("Habrahabr", "http://habrahabr.ru/post/205106/"), ("E-maxx", "http://e-maxx.ru/algo/euclid_algorithm")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-355")),
        
        Subtheme(
            
            name: "Решето Эратосфена",
            
            description: "nil",
            
            material: [("Foxford", "http://foxford.ru/wiki/informatika/resheto-eratosfena"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/BIwzyPBgU6Y/"), ("Habrahabr", "http://habrahabr.ru/post/91112/"), ("E-maxx", "http://e-maxx.ru/algo/eratosthenes_sieve")],
            
            tasks: nil),
        
        Subtheme(
            
            name: "Проверка на простоту",
            
            description: "nil",
            
            material: [("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/lK2k26ATt38/"), ("Foxford", "http://foxford.ru/wiki/informatika/proverka-prostoty-pereborom-deliteley")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-384")),
        
        Subtheme(
            
            name: "Разложение числа на простые множители",
            
            description: "nil",
            
            material: [("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/RdxW0PTgv2s/"), ("Foxford", "http://foxford.ru/wiki/informatika/faktorizatsiya-pereborom-deliteley")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-384")),
        
        ]),
    
    Theme(name: "Уравнения", subt: [
        
        Subtheme(
            
            name: "Уравнение прямой",
            
            description: "nil",
            
            material: [("E-maxx", "http://e-maxx.ru/algo/segment_to_line")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-406")),
        
        Subtheme(
            
            name: "Решение систем линейных уравнений",
            
            description: "nil",
            
            material: [("E-maxx", "http://e-maxx.ru/algo/linear_systems_gauss")],
            
            tasks: nil),
        
        Subtheme(
            
            name: "Решение линейных, квадратных уравнений",
            
            description: "nil",
            
            material: nil,
            
            tasks: nil),
        
        ]),
    
    Theme(name: "Комбинаторика", subt: [
        
        Subtheme(
            
            name: "Поиск следующего комбинаторного объекта",
            
            description: "nil",
            
            material: nil,
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-367")),
        
        Subtheme(
            
            name: "Поиск КО по номеру и номера по объекту",
            
            description: "nil",
            
            material: nil,
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-453")),
        
        Subtheme(
            
            name: "Количество комбинаторных объектов",
            
            description: "nil",
            
            material: [("Foxford", "http://foxford.ru/wiki/informatika/podschet-chisla-kombinatornyh-posledovatelnostey")],
            
            tasks: nil),
        
        Subtheme(
            
            name: "Сложность алгоритмов",
            
            description: "nil",
            
            material: [("Habrahabr", "http://habrahabr.ru/post/188010/"), ("Habrahabr", "http://habrahabr.ru/post/104219/"), ("Habrahabr", "http://habrahabr.ru/post/196560/")],
            
            tasks: nil),
        
        Subtheme(
            
            name: "Множества. Формула включения-исключения",
            
            description: "nil",
            
            material: [("E-maxx", "http://informatics.mccme.ru/py-source/source/dir/240-457"), ("E-maxx", "http://e-maxx.ru/algo/inclusion_exclusion_principle"), ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-423")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-457")),
        
        Subtheme(
            
            name: "Основные правила комбинаторики",
            
            description: "nil",
            
            material: nil,
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-18189")),
        
        Subtheme(
            
            name: "Перебор комбинаторных объектов",
            
            description: "nil",
            
            material: [("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/aram0M3qSbM/"), ("E-maxx", "http://e-maxx.ru/algo/generating_combinations"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/veWlgAMkQEs/"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/bwnRmaaYXMg/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-367")),
        
        Subtheme(
            
            name: "Биномиальные коэффициенты",
            
            description: "nil",
            
            material: [("E-maxx", "http://e-maxx.ru/algo/binomial_coeff"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/veWlgAMkQEs/")],
            
            tasks: nil),
        
        ]),
    
    Theme(name: "Геометрия", subt: [
        
        Subtheme(
            
            name: "Выпуклая оболочка",
            
            description: "nil",
            
            material: [("Habrahabr", "http://habrahabr.ru/post/144921/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-406")),
        
        Subtheme(
            
            name: "Многоугольники. Площадь многоугольников",
            
            description: "nil",
            
            material: [("E-maxx", "http://e-maxx.ru/algo/polygon_area"), ("E-maxx", "http://e-maxx.ru/algo/pt_in_polygon")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-406")),
        
        Subtheme(
            
            name: "Векторное произведение. Площадь треугольника",
            
            description: "nil",
            
            material: [("E-maxx", "http://e-maxx.ru/algo/euler_path")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-406")),
        
        Subtheme(
            
            name: "Векторы и декартовы координаты",
            
            description: "nil",
            
            material: nil,
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-406")),
        
        Subtheme(
            
            name: "Лучи и отрезки",
            
            description: "nil",
            
            material: nil,
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-406")),
        
        Subtheme(
            
            name: "Взаимное расположение точек и прямых",
            
            description: "nil",
            
            material: [("E-maxx", "http://e-maxx.ru/algo/segments_intersection_checking"), ("E-maxx", "http://e-maxx.ru/algo/lines_intersection"), ("E-maxx", "http://e-maxx.ru/algo/segments_intersection")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-406")),
        
        Subtheme(
            
            name: "Скалярное произведение",
            
            description: "nil",
            
            material: nil,
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-406")),
        
        Subtheme(
            
            name: "Вещественные числа",
            
            description: "nil",
            
            material: [("Habrahabr", "http://habrahabr.ru/company/xakep/blog/257897/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-414")),
        
        Subtheme(
            
            name: "Окружности",
            
            description: "nil",
            
            material: [("E-maxx", "http://e-maxx.ru/algo/circles_intersection"), ("E-maxx", "http://e-maxx.ru/algo/circle_line_intersection"), ("E-maxx", "http://e-maxx.ru/algo/circle_tangents")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-406")),
        
        Subtheme(
            
            name: "Угол. atan2",
            
            description: "nil",
            
            material: nil,
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-406")),
        
        Subtheme(
            
            name: "Клеточная геометрия",
            
            description: "nil",
            
            material: [("E-maxx", "http://e-maxx.ru/algo/pick_grid_theorem")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-445")),
        
        ]),
    
    Theme(name: "Графы", subt: [
        
        Subtheme(
            
            name: "Каркасы: алгоритм Краскала",
            
            description: "nil",
            
            material: [("E-maxx", "http://e-maxx.ru/algo/mst_kruskal_with_dsu"), ("Foxford", "http://foxford.ru/wiki/informatika/postroenie-minimalnogo-ostovnogo-dereva"), ("E-maxx", "http://e-maxx.ru/algo/mst_kruskal")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-390")),
        
        Subtheme(
            
            name: "Каркасы: алгоритм Прима",
            
            description: "nil",
            
            material: [("E-maxx", "http://e-maxx.ru/algo/mst_prim"), ("Foxford", "http://foxford.ru/wiki/informatika/postroenie-minimalnogo-ostovnogo-dereva")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-390")),
        
        Subtheme(
            
            name: "Алгоритм Дейкстры",
            
            description: "nil",
            
            material: [("Habrahabr", "http://habrahabr.ru/post/202314/"), ("E-maxx", "http://e-maxx.ru/algo/dijkstra"), ("Foxford", "http://foxford.ru/wiki/informatika/algoritm-deykstry")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-341")),
        
        Subtheme(
            
            name: "Хранение графа",
            
            description: "nil",
            
            material: [("Pythontutor", "http://pythontutor.ru/lessons/graphs/"), ("Foxford", "http://foxford.ru/wiki/informatika/hranenie-grafa-matritsa-smezhnosti"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/-4ydd-Gj9GY/"), ("Foxford", "http://foxford.ru/wiki/informatika/hranenie-grafa-spisok-reber"), ("Foxford", "http://foxford.ru/wiki/informatika/hranenie-grafa-spiski-smezhnyh-vershin")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-388")),
        
        Subtheme(
            
            name: "Алгоритм Форда-Фалкерсона",
            
            description: "nil",
            
            material: [("Foxford", "http://foxford.ru/wiki/informatika/algoritm-forda-bellmana")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-392")),
        
        Subtheme(
            
            name: "Поиск в ширину",
            
            description: "nil",
            
            material: [("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/YKxe2ZFVkHQ/"), ("Foxford", "http://foxford.ru/wiki/informatika/algoritm-poiska-v-shirinu"), ("E-maxx", "http://e-maxx.ru/algo/bfs"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/RL0BGVJxCKo/"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/sX5KYJd3GRY/"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/cUTOEaG36Sw/"), ("Habrahabr", "http://habrahabr.ru/post/200252/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-386")),
        
        Subtheme(
            
            name: "Кратчайшие пути в графе",
            
            description: "nil",
            
            material: nil,
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-338")),
        
        Subtheme(
            
            name: "Поиск в глубину",
            
            description: "nil",
            
            material: [("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/EJJ3eqOcHe8/"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/yPnelTAnZNE/"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/aX2vxp4NeqI/"), ("Habrahabr", "http://habrahabr.ru/post/200074/"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/NzFUZRNA3n8/"), ("Pythontutor", "http://pythontutor.ru/lessons/dfs/"), ("E-maxx", "http://e-maxx.ru/algo/dfs"), ("Foxford", "http://foxford.ru/wiki/informatika/algoritm-poiska-v-glubinu"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/oWc-uhuH0oo/"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/xZdaTdiidkk/"), ("E-maxx", "http://e-maxx.ru/algo/connected_components")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-387")),
        
        Subtheme(
            
            name: "Паросочетания",
            
            description: "nil",
            
            material: [("HardFire", "http://hardfire.ru/kuhn")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-432")),
        
        Subtheme(
            
            name: "Потоки",
            
            description: "nil",
            
            material: [("HardFire", "http://hardfire.ru/edmonds_karp"), ("Habrahabr", "http://habrahabr.ru/post/61884/"), ("E-maxx", "http://e-maxx.ru/algo/min_cost_flow_negative_cycles")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-391")),
        
        Subtheme(
            
            name: "Алгоритм Форда-Беллмана",
            
            description: "nil",
            
            material: [("Foxford", "http://foxford.ru/wiki/informatika/algoritm-forda-bellmana"), ("Habrahabr", "http://habrahabr.ru/post/201588/"), ("E-maxx", "http://e-maxx.ru/algo/ford_bellman")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-389")),
        
        Subtheme(
            
            name: "Алгоритм Флойда",
            
            description: "nil",
            
            material: [("Foxford", "http://foxford.ru/wiki/informatika/algoritm-floyda"), ("Habrahabr", "http://habrahabr.ru/post/119158/"), ("E-maxx", "http://e-maxx.ru/algo/floyd_warshall_algorithm")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-373")),
        
        Subtheme(
            
            name: "Эйлеров цикл",
            
            description: "nil",
            
            material: [("HardFire", "http://hardfire.ru/euler"), ("E-maxx", "http://e-maxx.ru/algo/euler_path")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-444")),
        
        Subtheme(
            
            name: "Топологическая сортировка",
            
            description: "nil",
            
            material: [("Habrahabr", "http://habrahabr.ru/post/100953/"), ("E-maxx", "http://e-maxx.ru/algo/topological_sort"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/RXGVcvGcKuE/")],
            
            tasks: nil),
        
        ]),
    
    Theme(name: "Прочее", subt: [
        
        Subtheme(
            
            name: "START",
            
            description: "nil",
            
            material: nil,
            
            tasks: nil),
        
        ]),
    
    Theme(name: "Рекурсия", subt: [
        
        Subtheme(
            
            name: "Рекурсия",
            
            description: "nil",
            
            material: [("Habrahabr", "http://habrahabr.ru/post/124856/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-347")),
        
        Subtheme(
            
            name: "Перебор вложенными циклами",
            
            description: "nil",
            
            material: [("Foxford", "http://foxford.ru/wiki/informatika/polnyy-perebor-s-ispolzovaniem-tsiklov")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-385")),
        
        Subtheme(
            
            name: "Рекурсивный перебор",
            
            description: "nil",
            
            material: nil,
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-366")),
        
        Subtheme(
            
            name: "Гамильтонов цикл",
            
            description: "nil",
            
            material: [("Foxford", "http://foxford.ru/wiki/informatika/postroenie-gamiltonova-tsikla")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-446")),
        
        Subtheme(
            
            name: "Перебор с отсечениями",
            
            description: "nil",
            
            material: [("Habrahabr", "http://habrahabr.ru/post/190850/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-372")),
        
        ]),
    
    Theme(name: "Поиск", subt: [
        
        Subtheme(
            
            name: "Поиск в массиве",
            
            description: "nil",
            
            material: [("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/YSjhrvKHo8Y/"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/Du70u7-gIsc/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-335")),
        
        Subtheme(
            
            name: "Однопроходные алгоритмы",
            
            description: "nil",
            
            material: [("Habrahabr", "http://habrahabr.ru/post/243819/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/mod/statements/view.php?id=12771")),
        
        Subtheme(
            
            name: "Бинарный поиск в упорядоченном массиве",
            
            description: "nil",
            
            material: [("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/5znFHMc5au4/"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/sPx1gETM7Eo/"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/w3nbKMuZqfg/"), ("Foxford", "http://foxford.ru/wiki/informatika/binarnyy-poisk-v-massive-na-python-dva-fiktivnyh-elementa")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-337")),
        
        Subtheme(
            
            name: "Другие линейные алгоритмы",
            
            description: "nil",
            
            material: nil,
            
            tasks: nil),
        
        Subtheme(
            
            name: "Вещественный бинарный поиск",
            
            description: "nil",
            
            material: nil,
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-438")),
        
        Subtheme(
            
            name: "Бинарный поиск по ответу",
            
            description: "nil",
            
            material: [("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/b2KZPLYqbzY/"), ("SIS.Video", "http://sis.khashaev.ru/2008/august/b-prime/YzsVQRESmeE/"), ("SIS.Video", "http://sis.khashaev.ru/2008/august/b-prime/3pVREiuGwQ8/"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/scSO8aMDGYQ/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-429")),
        
        Subtheme(
            
            name: "Сканирующая прямая",
            
            description: "nil",
            
            material: [("SIS.Video", "http://sis.khashaev.ru/2013/july/b-prime/042VezYjC7g/"), ("E-maxx", "http://e-maxx.ru/algo/intersecting_segments"), ("E-maxx", "http://e-maxx.ru/algo/triangles_union")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-430")),
        
        Subtheme(
            
            name: "Метод двух указателей",
            
            description: "nil",
            
            material: nil,
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-454")),
        
        Subtheme(
            
            name: "Тернарный поиск",
            
            description: "nil",
            
            material: [("E-maxx", "http://e-maxx.ru/algo/ternary_search")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-452")),
        
        ]),
    
    Theme(name: "Сортировки", subt: [
        
        Subtheme(
            
            name: "Квадратичные сортировки",
            
            description: "nil",
            
            material: [("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/kBHwr_e_aAg/"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/gZGwKXwjffg/"), ("Foxford", "http://foxford.ru/wiki/informatika/kvadratichnye-sortirovki-v-python")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-343")),
        
        Subtheme(
            
            name: "Подсчет. Сортировка подсчетом",
            
            description: "nil",
            
            material: [("Foxford", "http://foxford.ru/wiki/informatika/sortirovka-podschetom"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/Prz7x1bkW5Y/"), ("Foxford", "http://foxford.ru/wiki/informatika/porazryadnaya-sortirovka"), ("SIS.Video", "http://sis.khashaev.ru/2008/august/b-prime/kVcmMxhr-CI/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-424")),
        
        Subtheme(
            
            name: "Быстрая сортировка",
            
            description: "nil",
            
            material: [("Foxford", "http://foxford.ru/wiki/informatika/bystraya-sortirovka-hoara-python"), ("Foxford", "http://foxford.ru/wiki/informatika/bystraya-sortirovka-hoara"), ("SIS.Video", "http://sis.khashaev.ru/2008/august/b-prime/zw_JpBA5_rg/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-416")),
        
        Subtheme(
            
            name: "Сортировка слиянием",
            
            description: "nil",
            
            material: [("SIS.Video", "http://sis.khashaev.ru/2008/august/b-prime/7JoWmr6_ljM/"), ("Foxford", "http://foxford.ru/wiki/informatika/sortirovka-sliyaniem"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/leTOBaT9mSw/"), ("SIS.Video", "http://sis.khashaev.ru/2008/august/b-prime/itjUmHNrnA8/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-417")),
        
        Subtheme(
            
            name: "Порядковые статистики",
            
            description: "nil",
            
            material: [("SIS.Video", "http://sis.khashaev.ru/2008/august/b-prime/itjUmHNrnA8/"), ("E-maxx", "http://e-maxx.ru/algo/kth_order_statistics")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-431")),
        
        ]),
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

