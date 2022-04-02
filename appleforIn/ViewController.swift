//
//  ViewController.swift
//  appleforIn
//
//  Created by Chu Go-Go on 2022/1/17.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var frogLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var frogSlider: UISlider!
    @IBOutlet weak var styleSegmentedControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
//        讓畫面變成灰色
        frogLabel.backgroundColor = UIColor.lightGray
        // Do any additional setup after loading the view.
    }
    @IBAction func changedValue(_ sender: Any) {
//        更新畫面
        updateUI()
//        如果是九九乘法表的時候字型會變
        if styleSegmentedControl.selectedSegmentIndex == 4{
            frogLabel.textAlignment = .center
               frogLabel.font = UIFont(name:"Marker Felt", size: 20)
            ninenine()
        }else{
            frogLabel.textAlignment = .left
        }
    }
    
    @IBAction func chagneCount(_ sender: UISlider) {
//        設定每個不一樣的Segment會有不一樣的最大值
        if styleSegmentedControl.selectedSegmentIndex == 0 {
            frogSlider.maximumValue = 15
            normol()
        }else if styleSegmentedControl.selectedSegmentIndex == 1 {
            frogSlider.maximumValue = 15
            square()
        }else if styleSegmentedControl.selectedSegmentIndex == 2{
            frogSlider.maximumValue = 15
            pyramind()
        }else if styleSegmentedControl.selectedSegmentIndex == 3{
            frogSlider.maximumValue = 8
            diamond()
        }else if styleSegmentedControl.selectedSegmentIndex == 4{
            frogSlider.maximumValue = 10
            ninenine()
        }
    }
//    一般的直角三角型
    func normol(){
//        建立一個空字串
        var conntent = ""
//        把Slider的值換成整數Int
        let number = Int(frogSlider.value)
//        Label顯示Slider的值
        valueLabel.text = "\(number)"
//        迴圈跑1...Slider的值次數
        for i in 1...number{
//            小迴圈跑1...i的值的次數
            for _ in 1...i {
//                跑一次就會加一個emoji
                conntent = conntent + "🐸"
            }
//            最後再加入\n換行
            conntent = conntent + "\n"
        }
//      Label顯示裝的emoji
        frogLabel.text = conntent
    }
//    金字塔
    func pyramind(){
        //        讓文字置中
        frogLabel.textAlignment = .center
        var conntent = ""
        let number = Int(frogSlider.value)
        valueLabel.text = "\(number)"
        for i in 1...number{
            for _ in 1...i {
                conntent = conntent + "🐸"
            }
            conntent = conntent + "\n"
        }
        frogLabel.text = conntent
    }
    func square(){
        var conntent = ""
        let num = Int(frogSlider.value)
        valueLabel.text = "\(num)"
//        跑1...Slider的值次數
        for i in 1...num{
//        跑1...Slider的值次數
            for j in 1...num{
//                如果i跟j的數字一樣時emoji換成🍄
                if i == j {
                    conntent = conntent + "🍄"
                }else{
                    conntent = conntent + "🐸"
                }
            }
            conntent = conntent + "\n"
        }
        frogLabel.text = conntent
    }

    func diamond(){
//        讓文字置中
        frogLabel.textAlignment = .center
        var conntent = ""
        let number = Int(frogSlider.value)
//        設定迴圈的次數
        var frogcount = 1
        valueLabel.text = "\(number)"
//        讓迴圈跑number * 2 - 1次
        for i in 1...number * 2 - 1 {
//            裡面的回圈要跑1...frogcount
            for _ in 1...frogcount {
                conntent = conntent + "🐸"
            }
//            如果i小於number就會frogcount + 2
            if i < number {
                frogcount = frogcount + 2
            }else{
//            如果不是number就會frogcount - 2
                frogcount = frogcount - 2
            }
            conntent = conntent + "\n"
        }
        
        frogLabel.text = conntent
        
    }
    func ninenine(){

        let  number = Int(frogSlider.value)

//        儲存數字
        var numberArray = [String]()
//       讓回圈跑1...number次
        for i in 1...number{
//            讓裡面回圈跑1...9次
            for j in 1...9{
//                設定一個num是裝乘出來的數字
                let num = i * j
//                如果數字大於10就會.append("\(num) ")
                if num >= 10 {
                    numberArray.append("\(num) ")
//                其他間隔就會大一點.append("\(num)  \t")
                }else{
                    numberArray.append("\(num)  \t")
                }
//                如果算完一圈就會換行
                if j == 9{
                    numberArray.append("\n")
                }
            }
        }
//        建立一個把Array裡的值取出來的常數
        let takeOutArray = numberArray.joined(separator: "")
//        顯示在Label裡
        frogLabel.text = "\(takeOutArray)"
        valueLabel.text = "\(number)"
        
    }
    func updateUI(){
        frogLabel.frame = CGRect(x: 12, y: 390, width: 350, height: 330)
        frogLabel.text = ""
        valueLabel.text = "0"
        frogSlider.setValue(0, animated: true)
        
    }
//    func makeALabel(separatorChange: String , redCgcolor: CGFloat , blueCgcolor: CGFloat, xPoint: Int , yPoint: Int, maxVlue: Int) -> UILabel?{
//        let Label = UILabel(frame: CGRect(x: xPoint, y: yPoint, width: 350, height: 400))
//        var num = 0
//        var numArray = [String]()
//        Label.textAlignment = .center
//        Label.font = UIFont(name:"Marker Felt", size: 24)
//        Label.numberOfLines = 0
//        Label.textColor = UIColor(red: redCgcolor , green: 0, blue: blueCgcolor, alpha: 1)
//        for _ in 1...maxVlue{
//            num += 1
//            numArray.append("\(num)")
//
//        }
//
//        let takeOutArray = numArray.joined(separator: separatorChange)
//        Label.text = takeOutArray
//        view.addSubview(Label)
//        return Label
//
//    }
//    func makeARedLabel()-> UILabel?{
//        var rednum = 0
//        let Label = UILabel(frame: CGRect(x: -125, y: 345, width: 352, height: 400))
//        var numArray = [String]()
//        Label.textAlignment = .center
//        Label.font = UIFont(name:"Marker Felt", size: 20)
//        Label.numberOfLines = 0
//        Label.textColor = UIColor(red: 250 , green: 0, blue: 0, alpha: 1)
//        for _ in 1...10{
//            rednum += 1
//            numArray.append("\(rednum)")
//
//        }
//
//        let takeOutNumArray = numArray.joined(separator: "\n")
//        Label.text = takeOutNumArray
//        view.addSubview(Label)
//        return Label
//    }

}

