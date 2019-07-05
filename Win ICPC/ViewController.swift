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
    Theme(name: "Анализ текста", subt: [Subtheme(
        
        name: "Разбор выражений",
        
        description: """
Дана строка, представляющая собой математическое выражение, содержащее числа, переменные, различные операции. Требуется вычислить его значение за O (n), где n — длина строки.

Здесь описан алгоритм, который переводит это выражение в так называемую обратную польскую нотацию (явным или неявным образом), и уже в ней вычисляет выражение.
""",
        
        material: [("E-maxx", "http://e-maxx.ru/algo/expressions_parsing"), ("Foxford", "http://foxford.ru/wiki/informatika/obratnaya-polskaya-notatsiya")],
        
        tasks: ("Informatics", "https://informatics.mccme.ru/mod/statements/view3.php?id=7576&standing")),
                                                    
                                                    Subtheme(
                                                        
                                                        name: "Регулярные выражения",
                                                        
                                                        description: """
Регуля́рные выраже́ния (англ. regular expressions) — формальный язык поиска и осуществления манипуляций с подстроками в тексте, основанный на использовании метасимволов (символов-джокеров, англ. wildcard characters). Для поиска используется строка-образец (англ. pattern, по-русски её часто называют «шаблоном», «маской»), состоящая из символов и метасимволов и задающая правило поиска. Для манипуляций с текстом дополнительно задаётся строка замены, которая также может содержать в себе специальные символы.
""",
                                                        
                                                        material: [("Habrahabr", "http://habrahabr.ru/post/115825/")],
                                                        
                                                        tasks: ("Informatics", "https://informatics.mccme.ru/mod/statements/view.php?id=3163")),
                                                    
                                                    Subtheme(
                                                        
                                                        name: "Конечные автоматы",
                                                        
                                                        description: """
Конечный автомат — это некоторая абстрактная модель, содержащая конечное число состояний чего-либо. Используется для представления и управления потоком выполнения каких-либо команд.
""",
                                                        
                                                        material: [("Habrahabr", "http://habrahabr.ru/post/141503/")],
                                                        
                                                        tasks: ("Informatics", "https://informatics.mccme.ru/mod/statements/view.php?id=1509")),
                                                    
                                                    Subtheme(
                                                        
                                                        name: "Поиск подстроки в строке",
                                                        
                                                        description: """
Поиск подстроки в строке (англ. String searching algorithm) — класс алгоритмов над строками, которые позволяют найти паттерн (pattern) в тексте (text).
""",
                                                        
                                                        material: [("Habrahabr", "http://habrahabr.ru/post/113266/")],
                                                        
                                                        tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-434")),
                                                    
                                                    ]),
    
    Theme(name: "Структуры данных", subt: [
        
        Subtheme(
            
            name: "Система независимых множеств",
            
            description: """
Cтруктура данных "система непересекающихся множеств" (на английском "disjoint-set-union", или просто "DSU") предоставляет следующие возможности. Изначально имеется несколько элементов, каждый из которых находится в отдельном (своём собственном) множестве. За одну операцию можно объединить два каких-либо множества, а также можно запросить, в каком множестве сейчас находится указанный элемент. Также, в классическом варианте, вводится ещё одна операция — создание нового элемента, который помещается в отдельное множество.
""",
            
            material: [("Habrahabr", "http://habrahabr.ru/post/104772/"), ("E-maxx", "http://e-maxx.ru/algo/mst_kruskal_with_dsu"), ("E-maxx", "http://e-maxx.ru/algo/dsu")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-428")),
        
        Subtheme(
            
            name: "Сортировка кучей",
            
            description: """
Сортировка кучей, пирамидальная сортировка (англ. Heapsort) — алгоритм сортировки, использующий структуру данных двоичная куча. Это неустойчивый алгоритм сортировки с временем работы O(nlogn) , где n — количество элементов для сортировки, и использующий O(1) дополнительной памяти.
""",
            
            material: [("Habrahabr", "http://habrahabr.ru/post/112222/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-350")),
        
        Subtheme(
            
            name: "Очередь с приоритетами",
            
            description: """
Очередь с приоритетом (англ. priority queue) — абстрактный тип данных в программировании, поддерживающий две обязательные операции — добавить элемент и извлечь максимум[1](минимум). Предполагается, что для каждого элемента можно вычислить его приоритет — действительное число или в общем случае элемент линейно упорядоченного множества[2].
""",
            
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
            
            description: """
Дерево отрезков (англ. Segment tree) — это структура данных, которая позволяет за асимптотику O(log n) реализовать любые операции, определяемые на множестве, на котором данная операция ассоциативна, и существует нейтральный элемент относительно этой операции, то есть на моноиде. Например, суммирование на множестве натуральных чисел, поиск минимума на любом числовом множестве, перемножение матриц на множестве матриц размера N∗N, объединение множеств, поиск наибольшего общего делителя на множестве целых чисел и многочленов.
""",
            
            material: [("Habrahabr", "http://habrahabr.ru/post/115026/"), ("E-maxx", "http://e-maxx.ru/algo/segment_tree"), ("SIS.Video", "http://sis.khashaev.ru/2013/july/a/mnpAaPpLP7U/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-420")),
        
        Subtheme(
            
            name: "Куча",
            
            description: """
В компьютерных науках куча — это специализированная структура данных типа дерево, которая удовлетворяет свойству кучи: если B является узлом-потомком узла A, то ключ(A) ≥ ключ(B). Из этого следует, что элемент с наибольшим ключом всегда является корневым узлом кучи, поэтому иногда такие кучи называют max-кучами (в качестве альтернативы, если сравнение перевернуть, то наименьший элемент будет всегда корневым узлом, такие кучи называют min-кучами). Не существует никаких ограничений относительно того, сколько узлов-потомков имеет каждый узел кучи, хотя на практике их число обычно не более двух. Куча является максимально эффективной реализацией абстрактного типа данных, который называется очередью с приоритетом. Кучи имеют решающее значение в некоторых эффективных алгоритмах на графах, таких, как алгоритм Дейкстры на d-кучах и сортировка методом пирамиды.
""",
            
            material: [("Foxford", "http://foxford.ru/wiki/informatika/kucha-heap"), ("Habrahabr", "http://habrahabr.ru/post/112222/"), ("E-maxx", "http://e-maxx.ru/algo/randomized_heap")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-350")),
        
        Subtheme(
            
            name: "Дерево поиска",
            
            description: """
Двоичное дерево поиска (англ. binary search tree, BST) — это двоичное дерево, для которого выполняются следующие дополнительные условия (свойства дерева поиска):

1. Оба поддерева — левое и правое — являются двоичными деревьями поиска.
2. У всех узлов левого поддерева произвольного узла X значения ключей данных меньше, нежели значение ключа данных самого узла X.
3. У всех узлов правого поддерева произвольного узла X значения ключей данных больше либо равны, нежели значение ключа данных самого узла X.
""",
            
            material: [("Habrahabr", "http://habrahabr.ru/post/145388/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-419")),
        
        Subtheme(
            
            name: "Декартово дерево",
            
            description: """
Декартово дерево или дерамида (англ. Treap) — это структура данных, объединяющая в себе бинарное дерево поиска и бинарную кучу (отсюда и второе её название: treap (tree + heap) и дерамида (дерево + пирамида), также существует название курево (куча + дерево).
""",
            
            material: [("E-maxx", "http://e-maxx.ru/algo/treap"), ("Habrahabr", "https://habrahabr.ru/post/101818/")],
            
            tasks: nil),
        
        Subtheme(
            
            name: "Декартово дерево по неявному ключу",
            
            description: """
Возьмем структуру данных динамический массив. В её стандартной реализации мы умеем добавлять элемент в конец вектора, узнавать значение элемента, стоящего на определенной позиции, изменять элемент по номеру и удалять последний элемент. Предположим, что нам необходима структура данных с вышеуказанными свойствами, а также с операциями: добавить элемент в любое место (с соответствующим изменением нумерации элементов) и удалить любой элемент (также с соответствующим изменением нумерации). Такую структуру можно реализовать на базе декартового дерева, результат часто называют декартово дерево по неявному ключу (англ. Treap with implicit key).
""",
            
            material: [("Habrahabr", "https://habrahabr.ru/post/102364/")],
            
            tasks: nil),
        
        Subtheme(
            
            name: "Множества и словари",
            
            description: """
Множество — это структура данных, эквивалентная множествам в математике. Множество состоит из различных элементов задачнного типа и поддерживает операции добавления элемента в множество, удаления элемента из множества, проверка принадлежности элемента множеству. Одно и то же значение хранится в множестве только один раз.
Словарь - неупорядоченная коллекция произвольных объектов с доступом по ключу. Ее иногда называют ассоциативными массивами или хеш-таблицами.
""",
            
            material: [("Informatics", "https://informatics.mccme.ru/moodle/mod/book/view.php?id=6693"), ("Informatics", "https://informatics.mccme.ru/moodle/mod/book/view.php?id=6694")],
            
            tasks:("Informatics", "https://informatics.mccme.ru/mod/statements/view3.php?id=7378&chapterid=3749")),
        
        Subtheme(
            
            name: "Связный список",
            
            description: """
Связный список — базовая динамическая структура данных в информатике, состоящая из узлов, каждый из которых содержит как собственно данные, так и одну или две ссылки («связки») на следующий и/или предыдущий узел списка. Принципиальным преимуществом перед массивом является структурная гибкость: порядок элементов связного списка может не совпадать с порядком расположения элементов данных в памяти компьютера, а порядок обхода списка всегда явно задаётся его внутренними связями.
""",
            
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
            
            description: """
            Большинство комбинаторных задач решается с помощью двух основных правил - правила суммы и правила произведения.
            
            Правило суммы. Если некоторый объект A можно выбрать n способами, а другой объект B можно выбрать m способами, то выбор "либо A, либо B" можно осуществить n+m способами.
            
            Правило произведения. Если объект A можно выбрать n способами, а после каждого такого выбора другой объект B можно выбрать (независимо от выбора объекта A) m способами, то пары объектов A и B можно выбрать n способами.
""",
            
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
            
            description: "Скаля́рное произведе́ние (иногда внутреннее произведение) — операция над двумя векторами, результатом которой является число (когда рассматриваются векторы, числа часто называют скалярами), не зависящее от системы координат и характеризующее длины векторов-сомножителей и угол между ними. Данной операции соответствует умножение длины вектора x на проекцию вектора y на вектор x. Эта операция обычно рассматривается как коммутативная и линейная по каждому сомножителю.",
            
            material: nil,
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-406")),
        
        Subtheme(
            
            name: "Вещественные числа",
            
            description: "Использование вещественных чисел в решении задач",
            
            material: [("Habrahabr", "http://habrahabr.ru/company/xakep/blog/257897/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-414")),
        
        Subtheme(
            
            name: "Окружности",
            
            description: "Использование окружностей в решении задач",
            
            material: [("E-maxx", "http://e-maxx.ru/algo/circles_intersection"), ("E-maxx", "http://e-maxx.ru/algo/circle_line_intersection"), ("E-maxx", "http://e-maxx.ru/algo/circle_tangents")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-406")),
        
        Subtheme(
            
            name: "Угол",
            
            description: "Использование углов в решении задач",
            
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
            
            description: """
Алгоритм Краскала — эффективный алгоритм построения минимального остовного дерева взвешенного связного неориентированного графа. Также алгоритм используется для нахождения некоторых приближений для задачи Штейнера.

Алгоритм описан Джозефом Краскалом (англ.) в 1956 году, этот алгоритм почти не отличается от aлгоритма Борувки предложенный Отакаром Борувкой в 1926 году.
""",
            
            material: [("E-maxx", "http://e-maxx.ru/algo/mst_kruskal_with_dsu"), ("Foxford", "http://foxford.ru/wiki/informatika/postroenie-minimalnogo-ostovnogo-dereva"), ("E-maxx", "http://e-maxx.ru/algo/mst_kruskal")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-390")),
        
        Subtheme(
            
            name: "Каркасы: алгоритм Прима",
            
            description: """
Алгоритм Прима — алгоритм построения минимального остовного дерева взвешенного связного неориентированного графа. Алгоритм впервые был открыт в 1930 году чешским математиком Войцехом Ярником, позже переоткрыт Робертом Примом в 1957 году, и, независимо от них, Э. Дейкстрой в 1959 году.
""",
            
            material: [("E-maxx", "http://e-maxx.ru/algo/mst_prim"), ("Foxford", "http://foxford.ru/wiki/informatika/postroenie-minimalnogo-ostovnogo-dereva")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-390")),
        
        Subtheme(
            
            name: "Алгоритм Дейкстры",
            
            description: """
Алгори́тм Де́йкстры (англ. Dijkstra’s algorithm) — алгоритм на графах, изобретённый нидерландским учёным Эдсгером Дейкстрой в 1959 году. Находит кратчайшие пути от одной из вершин графа до всех остальных. Алгоритм работает только для графов без рёбер отрицательного веса. Алгоритм широко применяется в программировании и технологиях, например, его используют протоколы маршрутизации OSPF и IS-IS.
""",
            
            material: [("Habrahabr", "http://habrahabr.ru/post/202314/"), ("E-maxx", "http://e-maxx.ru/algo/dijkstra"), ("Foxford", "http://foxford.ru/wiki/informatika/algoritm-deykstry")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-341")),
        
        Subtheme(
            
            name: "Хранение графа",
            
            description: """
Картинки по запросу графыru.wikipedia.org
Граф – это совокупность двух множеств: множества точек, которые называются вершинами, и множества ребер А. Каждый элемент есть упорядоченная пара элементов множества , вершины и называются концевыми точками или концами ребра а.
""",
            
            material: [("Pythontutor", "http://pythontutor.ru/lessons/graphs/"), ("Foxford", "http://foxford.ru/wiki/informatika/hranenie-grafa-matritsa-smezhnosti"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/-4ydd-Gj9GY/"), ("Foxford", "http://foxford.ru/wiki/informatika/hranenie-grafa-spisok-reber"), ("Foxford", "http://foxford.ru/wiki/informatika/hranenie-grafa-spiski-smezhnyh-vershin")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-388")),
        
        Subtheme(
            
            name: "Алгоритм Форда-Фалкерсона",
            
            description: """
            Алгоритм Форда — Фалкерсона решает задачу нахождения максимального потока в транспортной сети.
            
            Идея алгоритма заключается в следующем. Изначально величине потока присваивается значение 0:  f(u,v)=0 для всех  u,v in V. Затем величина потока итеративно увеличивается посредством поиска увеличивающего пути (путь от источника s к стоку t, вдоль которого можно послать больший поток). Процесс повторяется, пока можно найти увеличивающий путь.
            """,
            
            material: [("Foxford", "http://foxford.ru/wiki/informatika/algoritm-forda-bellmana")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-392")),
        
        Subtheme(
            
            name: "Поиск в ширину",
            
            description: """
Алгоритм поиска в ширину (англ. breadth-first search, BFS) позволяет найти кратчайшие пути из одной вершины невзвешенного (ориентированного или неориентированного) графа до всех остальных вершин. Под кратчайшим путем подразумевается путь, содержащий наименьшее число ребер.
""",
            
            material: [("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/YKxe2ZFVkHQ/"), ("Foxford", "http://foxford.ru/wiki/informatika/algoritm-poiska-v-shirinu"), ("E-maxx", "http://e-maxx.ru/algo/bfs"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/RL0BGVJxCKo/"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/sX5KYJd3GRY/"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/cUTOEaG36Sw/"), ("Habrahabr", "http://habrahabr.ru/post/200252/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-386")),
        
        Subtheme(
            
            name: "Кратчайшие пути в графе",
            
            description: """
Зада́ча о кратча́йшем пути́ — задача поиска самого короткого пути (цепи) между двумя точками (вершинами) на графе, в которой минимизируется сумма весов рёбер, составляющих путь.

Задача о кратчайшем пути является одной из важнейших классических задач теории графов. Сегодня известно множество алгоритмов для её решения[⇨].

У данной задачи существуют и другие названия: задача о минимальном пути или, в устаревшем варианте, задача о дилижансе.

Значимость данной задачи определяется её различными практическими применениями[⇨]. Например, в GPS-навигаторах осуществляется поиск кратчайшего пути между двумя перекрёстками. В качестве вершин выступают перекрёстки, а дороги являются рёбрами, которые лежат между ними. Если сумма длин дорог между перекрёстками минимальна, тогда найденный путь самый короткий.
""",
            
            material: [("Wikipedia", "https://ru.wikipedia.org/wiki/%D0%97%D0%B0%D0%B4%D0%B0%D1%87%D0%B0_%D0%BE_%D0%BA%D1%80%D0%B0%D1%82%D1%87%D0%B0%D0%B9%D1%88%D0%B5%D0%BC_%D0%BF%D1%83%D1%82%D0%B8")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-338")),
        
        Subtheme(
            
            name: "Поиск в глубину",
            
            description: """
Поиск в глубину (англ. Depth-first search, DFS) — один из методов обхода графа. Стратегия поиска в глубину, как и следует из названия, состоит в том, чтобы идти «вглубь» графа, насколько это возможно. Алгоритм поиска описывается рекурсивно: перебираем все исходящие из рассматриваемой вершины рёбра. Если ребро ведёт в вершину, которая не была рассмотрена ранее, то запускаем алгоритм от этой нерассмотренной вершины, а после возвращаемся и продолжаем перебирать рёбра. Возврат происходит в том случае, если в рассматриваемой вершине не осталось рёбер, которые ведут в нерассмотренную вершину. Если после завершения алгоритма не все вершины были рассмотрены, то необходимо запустить алгоритм от одной из нерассмотренных вершин.
""",
            
            material: [("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/EJJ3eqOcHe8/"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/yPnelTAnZNE/"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/aX2vxp4NeqI/"), ("Habrahabr", "http://habrahabr.ru/post/200074/"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/NzFUZRNA3n8/"), ("Pythontutor", "http://pythontutor.ru/lessons/dfs/"), ("E-maxx", "http://e-maxx.ru/algo/dfs"), ("Foxford", "http://foxford.ru/wiki/informatika/algoritm-poiska-v-glubinu"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/oWc-uhuH0oo/"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/xZdaTdiidkk/"), ("E-maxx", "http://e-maxx.ru/algo/connected_components")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-387")),
        
        Subtheme(
            
            name: "Паросочетания",
            
            description: "nil",
            
            material: [("HardFire", "http://hardfire.ru/kuhn")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-432")),
        
        Subtheme(
            
            name: "Потоки",
            
            description: "",
            
            material: [("HardFire", "http://hardfire.ru/edmonds_karp"), ("Habrahabr", "http://habrahabr.ru/post/61884/"), ("E-maxx", "http://e-maxx.ru/algo/min_cost_flow_negative_cycles")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-391")),
        
        Subtheme(
            
            name: "Алгоритм Форда-Беллмана",
            
            description: """
Алгоритм Форда-Беллмана позволяет найти кратчайшие пути из одной вершины графа до всех остальных, даже для графов, в которых веса ребер могут быть отрицательными. Тем не менее, в графе не должно быть циклов отрицательного веса, достижимых из начальной вершины, иначе вопрос о кратчайших путях является бессмысленным. При этом алгоритм Форда-Беллмана позволяет определить наличие циклов отрицательного веса, достижимых из начальной вершины.
""",
            
            material: [("Foxford", "http://foxford.ru/wiki/informatika/algoritm-forda-bellmana"), ("Habrahabr", "http://habrahabr.ru/post/201588/"), ("E-maxx", "http://e-maxx.ru/algo/ford_bellman")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-389")),
        
        Subtheme(
            
            name: "Алгоритм Флойда",
            
            description: """
Алгоритм Флойда (алгоритм Флойда–Уоршелла) — алгоритм нахождения длин кратчайших путей между всеми парами вершин во взвешенном ориентированном графе. Работает корректно, если в графе нет циклов отрицательной величины, а в случае, когда такой цикл есть, позволяет найти хотя бы один такой цикл. Алгоритм работает за Θ(n3) времени и использует Θ(n2) памяти. Разработан в 1962 году.
""",
            
            material: [("Foxford", "http://foxford.ru/wiki/informatika/algoritm-floyda"), ("Habrahabr", "http://habrahabr.ru/post/119158/"), ("E-maxx", "http://e-maxx.ru/algo/floyd_warshall_algorithm")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-373")),
        
        Subtheme(
            
            name: "Эйлеров цикл",
            
            description: """
Эйлеров цикл — эйлеров путь, являющийся циклом, то есть замкнутый путь, проходящий через каждое ребро графа ровно по одному разу.
""",
            
            material: [("HardFire", "http://hardfire.ru/euler"), ("E-maxx", "http://e-maxx.ru/algo/euler_path")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-444")),
        
        Subtheme(
            
            name: "Топологическая сортировка",
            
            description: """
Топологическая сортировка — упорядочивание вершин бесконтурного ориентированного графа согласно частичному порядку, заданному ребрами орграфа на множестве его вершин.
""",
            
            material: [("Habrahabr", "http://habrahabr.ru/post/100953/"), ("E-maxx", "http://e-maxx.ru/algo/topological_sort"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/RXGVcvGcKuE/")],
            
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
            
            description: """
Гамильто́нов граф — математический объект теории графов. Представляет собой граф (набор точек и соединяющих их линий), который содержит гамильтонов цикл. При этом гамильтоновым циклом является такой цикл (замкнутый путь), который проходит через каждую вершину данного графа ровно по одному разу.
""",
            
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
            
            description: """
Трои́чный по́иск (Тернарный поиск) — это метод в информатике для поиска максимумов и минимумов функции, которая либо сначала строго возрастает, затем строго убывает, либо наоборот. Троичный поиск определяет, что минимум или максимум не может лежать либо в первой, либо в последней трети области, и затем повторяет поиск на оставшихся двух третях. Троичный поиск демонстрирует парадигму программирования «разделяй и властвуй».
""",
            
            material: [("E-maxx", "http://e-maxx.ru/algo/ternary_search")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-452")),
        
        ]),
    
    Theme(name: "Сортировки", subt: [
        
        Subtheme(
            
            name: "Квадратичные сортировки",
            
            description: """
Одна из наиболее часто возникающих в программировании задач — задача о сортировке элементов массива (списка). Постановка задачи — дан список элементов A, которые можно сравнивать (например, чисел, строк, кортежей и т. д.). Необходимо переставить элементы списка местами так, чтобы было выполнено условие A[i]<=A[i+1] для всех пар соседних элементов. Например, если был дан список [4, 1, 2, 4, 2, 3], то отсортированный список будет иметь вид [1, 2, 2, 3, 4, 4]. Такой порядок сортировки называется сортировкой по неубыванию элементов (но чаще используют не вполне точный термин «сортировка в порядке возрастания»). Если заменить условие на A[i] >= A[i+1], то получится сортировка в порядке невозрастания (убывания). Для сортировки списков придумано много различных алгоритмов.
""",
            
            material: [("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/kBHwr_e_aAg/"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/gZGwKXwjffg/"), ("Foxford", "http://foxford.ru/wiki/informatika/kvadratichnye-sortirovki-v-python")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-343")),
        
        Subtheme(
            
            name: "Подсчет. Сортировка подсчетом",
            
            description: """
Сортировка подсчётом[ (англ. counting sort; сортировка посредством подсчёта англ. sorting by counting) — алгоритм сортировки, в котором используется диапазон чисел сортируемого массива (списка) для подсчёта совпадающих элементов. Применение сортировки подсчётом целесообразно лишь тогда, когда сортируемые числа имеют (или их можно отобразить в) диапазон возможных значений, который достаточно мал по сравнению с сортируемым множеством, например, миллион натуральных чисел меньших 1000.
""",
            
            material: [("Foxford", "http://foxford.ru/wiki/informatika/sortirovka-podschetom"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/Prz7x1bkW5Y/"), ("Foxford", "http://foxford.ru/wiki/informatika/porazryadnaya-sortirovka"), ("SIS.Video", "http://sis.khashaev.ru/2008/august/b-prime/kVcmMxhr-CI/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-424")),
        
        Subtheme(
            
            name: """
            Быстрая сортировка, сортировка Хоара (англ. quicksort), часто называемая qsort (по имени в стандартной библиотеке языка Си) — широко известный алгоритм сортировки, разработанный английским информатиком Чарльзом Хоаром во время его работы в МГУ в 1960 году.
            
            Один из самых быстрых известных универсальных алгоритмов сортировки массивов: в среднем O(n/log n) обменов при упорядочении n элементов; из-за наличия ряда недостатков на практике обычно используется с некоторыми доработками.
            """,
            
            description: "nil",
            
            material: [("Foxford", "http://foxford.ru/wiki/informatika/bystraya-sortirovka-hoara-python"), ("Foxford", "http://foxford.ru/wiki/informatika/bystraya-sortirovka-hoara"), ("SIS.Video", "http://sis.khashaev.ru/2008/august/b-prime/zw_JpBA5_rg/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-416")),
        
        Subtheme(
            
            name: "Сортировка слиянием",
            
            description: """
Сортировка слиянием (англ. merge sort) — алгоритм сортировки, который упорядочивает списки (или другие структуры данных, доступ к элементам которых можно получать только последовательно, например — потоки) в определённом порядке. Эта сортировка — хороший пример использования принципа «разделяй и властвуй». Сначала задача разбивается на несколько подзадач меньшего размера. Затем эти задачи решаются с помощью рекурсивного вызова или непосредственно, если их размер достаточно мал. Наконец, их решения комбинируются, и получается решение исходной задачи.
""",
            
            material: [("SIS.Video", "http://sis.khashaev.ru/2008/august/b-prime/7JoWmr6_ljM/"), ("Foxford", "http://foxford.ru/wiki/informatika/sortirovka-sliyaniem"), ("SIS.Video", "http://sis.khashaev.ru/2013/august/c-prime/leTOBaT9mSw/"), ("SIS.Video", "http://sis.khashaev.ru/2008/august/b-prime/itjUmHNrnA8/")],
            
            tasks: ("Informatics", "http://informatics.mccme.ru/py-source/source/dir/240-417")),
        
        Subtheme(
            
            name: "Порядковые статистики",
            
            description: """
Поря́дковые стати́стики в математической статистике - это упорядоченная по неубыванию выборка одинаково распределённых независимых случайных величин и её элементы, занимающие строго определенное место в ранжированной совокупности.
""",
            
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

