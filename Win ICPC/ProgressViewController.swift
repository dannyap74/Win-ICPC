//
//  ViewController.swift
//  TestProduct
//
//  Created by Yan Olerinskiy on 01/07/2019.
//  Copyright © 2019 Yan Olerinskiy. All rights reserved.
//

import UIKit
import Charts

var solvedByDays = [0.0,1.0,0.0,3.0,2.0,0.0,0.0,5.0,0.0,2.0,1.0,1.0,8.0,0.0]
var dayNumber = 13
let date = Date()
let calendar = Calendar.current
let day = calendar.ordinality(of: .day, in: .year, for: date)!
let rightValues = ["Monday": ["Вт", "Ср", "Чт", "Пт", "Сб", "Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс", "Пн"],
                   "Tuesday": ["Ср", "Чт", "Пт", "Сб", "Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс", "Пн", "Вт"],
                   "Wednesday": ["Чт", "Пт", "Сб", "Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс", "Пн", "Вт", "Ср"],
                   "Thursday": ["Пт", "Сб", "Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс", "Пн", "Вт", "Ср", "Чт"],
                   "Friday": ["Сб", "Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс", "Пн", "Вт", "Ср", "Чт", "Пт"],
                   "Saturday": ["Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб"],
                   "Sunday": ["Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"]
]
var drawEverything = false
var resetFlag = false
var defaultData = true
var animated = false
let cur = DateFormatter().weekdaySymbols[Calendar.current.component(.weekday, from: Date()) - 1]
class ProgressViewController: UIViewController {

    @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet weak var table: UITableView!
    func checkDate() {
        let calendar = Calendar.current
        let day = calendar.ordinality(of: .day, in: .year, for: date)!
        if UserDefaults.standard.string(forKey: "DayNumber") == nil {
            UserDefaults.standard.set(calendar.ordinality(of: .day, in: .year, for: date), forKey: "DayNumber")
        } else if UserDefaults.standard.integer(forKey: "DayNumber") != day {
            // Снизу баг - я не учитываю високосный год, но в рамках проекта тратить на это время смысла нет
            while UserDefaults.standard.integer(forKey: "DayNumber") != day {
                UserDefaults.standard.set(UserDefaults.standard.integer(forKey: "DayNumber") % 365 + 1, forKey: "DayNumber")
                newDay(solved: 0)
                UpdateSolved()
            }
        }
    }
    // Написать метод, который будет изменять количество решенных задач за "сегодня" (solvedByDays[13])
    class ChartStringFormatter: NSObject, IAxisValueFormatter {
        let nameValues: [String]! = rightValues[cur]
        public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
            return String(describing: nameValues[Int(value)])
        }
    }
    func customizeChart(values: [Double]) {
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<14 {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Количество решенных вами задач")
        let chartData = BarChartData(dataSet: chartDataSet)
        if drawEverything == false {
            let formatter = ChartStringFormatter()
            let xAxis = barChartView.xAxis
            xAxis.valueFormatter = formatter
            //        chartDataSet.colors = [UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 1)]
            barChartView.xAxis.labelPosition = .bottom
            if animated == false {
                barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
                animated = true
            }
            var ll = ChartLimitLine(limit: 0)
            if resetFlag == true {
                barChartView.rightAxis.removeAllLimitLines()
            } else {
                resetFlag = true
            }
            ll = ChartLimitLine(limit: round(Double(1000*sum(start:0, end:14))/7.0)/1000, label: "Avg")
            ll.lineColor = UIColor(red: 200/255, green: 40/255, blue: 35/255, alpha: 0.8)
            ll.labelPosition = .bottomLeft
            barChartView.rightAxis.addLimitLine(ll)
            xAxis.drawGridLinesEnabled = false
            barChartView.drawValueAboveBarEnabled = false
            let limitLine = ChartLimitLine(limit: 0, label: "")
            limitLine.lineColor = UIColor.black.withAlphaComponent(0.3)
            limitLine.lineWidth = 1
            barChartView.rightAxis.addLimitLine(limitLine)
            drawEverything = true
        }
        barChartView.data = chartData
    }
    @IBAction func plusOne(_ sender: UIButton) {
        solvedByDays[13] += 1
        drawEverything = false
        UpdateSolved()
        table.reloadData()
        viewDidLoad()
        UpdateSolved()
        
    }
    @IBAction func minusOne(_ sender: UIButton) {
        solvedByDays[13] = max(solvedByDays[13] - 1, 0)
        drawEverything = false
        UpdateSolved()
        table.reloadData()
        viewDidLoad()
        UpdateSolved()
    }
    //    @IBAction func reset(_ sender: UIButton) {
    //        drawEverything = false
    //        table.reloadData()
    //        UpdateSolved()
    //        viewDidLoad()
    //    }
    
    func UpdateSolved() {
        UserDefaults.standard.set(solvedByDays, forKey: "solved")
        print("updated")
        print("Defaults \(UserDefaults.standard.array(forKey: "solved") as! [Double])")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        table.dataSource = self
        print(solvedByDays)
        if UserDefaults.standard.array(forKey: "solved") == nil {
            UserDefaults.standard.set(solvedByDays, forKey: "solved")
            print("here")
        }
        solvedByDays = UserDefaults.standard.array(forKey: "solved") as! [Double]
        print("after")
        print(solvedByDays)
        print("did load defaults \(UserDefaults.standard.array(forKey: "solved") as! [Double])")
        //        barChartView.noDataText = "You need to provide data for the chart."
        //        barChartView.noDataTextColor
        checkDate()
        customizeChart(values: solvedByDays)
    }
}

func sum(start: Int, end: Int) -> Double {
    var ans = 0.0
    for i in start..<end {
        ans += solvedByDays[i]
    }
    return ans
}

func newDay(solved: Double) {
    solvedByDays.append(solved)
    solvedByDays.removeFirst()
}

extension ProgressViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath)
        if indexPath.row == 0 {
            cell.textLabel?.text = "Сегодня:"
            cell.detailTextLabel!.text = String(solvedByDays[dayNumber])
        }
        if indexPath.row == 1 {
            cell.textLabel?.text = "В этот день неделю назад:"
            cell.detailTextLabel!.text = String(solvedByDays[dayNumber - 7])
        }
        if indexPath.row == 2 {
            cell.textLabel?.text = "В среднем за неделю:"
            let y = Double(round(Double(100*sum(start:7, end:14))/7.0)/100)
            cell.detailTextLabel!.text = String(y)
        }
        if indexPath.row == 3 {
            cell.textLabel?.text = "За эту неделю:"
            cell.detailTextLabel!.text = String(sum(start:7, end:14))
        }
        if indexPath.row == 4 {
            cell.textLabel?.text = "В среднем за 2 недели:"
            let y = Double(round(Double(100*sum(start:0, end:14))/7.0)/100)
            cell.detailTextLabel!.text = String(y)
        }
        return cell
    }
    
    
}
