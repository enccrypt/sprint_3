//
//  ViewController.swift
//  Counter
//
//  Created by Islam Tagirov on 22.06.2024.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var changeCountButton: UIButton!
    @IBOutlet weak var resetCountButton: UIButton!
    @IBOutlet weak var historyLabel: UITextView!
    
    private var count: Int = 0
    
    //используем ленивую переменную для
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm:ss" //настройка формата даты и времени
        formatter.timeZone = TimeZone.current // текущаю временная зона
        return formatter // возвращает дату типа Date
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyLabel.text = "История изменений: "
        counterLabel.text = "Значение счетчика: \(count)"
        
    }
    
    @IBAction func increaseTapped(_ sender: Any) {
        count += 1
        let currentDate = dateFormatter.string(from: Date())
        counterLabel.text = "Значение счетчика: \(count)"
        historyLabel.text += "\n [\(currentDate)]: значение изменено на +1"
    }
    
    
    @IBAction func decreaseTapped(_ sender: Any) {
        let currentDate = dateFormatter.string(from: Date()) //конвертируем текущее дату и время в строку

        if count > 0{
            count -= 1
            counterLabel.text = "Значение счетчика: \(count)"
            historyLabel.text += "\n [\(currentDate)]: значение изменено на -1"
        } else{
            counterLabel.text = "Значение счетчика: \(count)"
            historyLabel.text += "\n [\(currentDate)]: попытка уменьшить значение счётчика ниже 0"
        }
    }
    
    
    @IBAction func resetTapped(_ sender: Any) {
        let currentDate = dateFormatter.string(from: Date())
        count = 0
        counterLabel.text = "Значение счетчика: \(count)"
        historyLabel.text += "\n [\(currentDate)]: значение сброшено"
    }
    
    
    



}

