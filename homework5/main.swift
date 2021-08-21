//
//  main.swift
//  homework5
//
//  Created by Дмитрий Виноградов on 20.08.2021.
//

import Foundation

// 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.

protocol CarProtocol {
    var markAuto: String { get set }
    var country: String { get set }
    var engineStatus: engineStatus { get set }
    var windowStatus: windowStatus { get set }
    
    func doSome()
}

enum engineStatus {
    case on, off
}

enum windowStatus {
    case up, dowm
}


// 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).

extension CarProtocol {
    mutating func actionWindow(windowStatus: windowStatus) {
        if windowStatus == .dowm {
            self.windowStatus = .dowm
            print("Окна открыты")
        } else {
            print("Окна закрыты")
        }
    }
    
    mutating func actionEngine(engineStatus: engineStatus) {
        if engineStatus == .off {
            self.engineStatus = .off
            print("Двигатель заглушен")
        } else {
            print("Двигатель работет")
        }
    }
}


// 3. Создать два класса, имплементирующих протокол «Car»: tunkCar и sportCar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.

class sportCar: CarProtocol {
    
    var markAuto: String
    var country: String
    var engineStatus: engineStatus
    var windowStatus: windowStatus
    var maxSpeed: Int
    
    func doSome() {
        print("Something")
    }
    
    
    init(markAuto: String, country: String, engineStatus: engineStatus, windowStatus: windowStatus, maxSpeed: Int) {
        self.markAuto = markAuto
        self.country = country
        self.engineStatus = engineStatus
        self.windowStatus = windowStatus
        self.maxSpeed = maxSpeed
        
    }
    
}

class trunkCar: CarProtocol {
    
    var markAuto: String
    var country: String
    var engineStatus: engineStatus
    var windowStatus: windowStatus
    var cistern: Int
    
    func doSome() {
        print("Something")
    }
    
    init(markAuto: String, country: String, engineStatus: engineStatus, windowStatus: windowStatus, cistern: Int) {
        
        self.markAuto = markAuto
        self.country = country
        self.engineStatus = engineStatus
        self.windowStatus = windowStatus
        self.cistern = cistern
    }
    
}

// 4. Для каждого класса написать расширение, имплементирующее протокол «CustomStringConvertible».


extension trunkCar: CustomStringConvertible {
    
    var description: String {
        return "Грузовое авто марки \(markAuto) из страны \(country) имеет объем цистерны \(cistern) литров"
    }
}

extension sportCar: CustomStringConvertible {
    var description: String {
        return "Автомобиль \(markAuto) из страны \(country) едет со скоростью \(maxSpeed) km."
        
    }
}

// 5. Создать несколько объектов каждого класса. Применить к ним различные действия.

var mazda: sportCar = sportCar(markAuto: "mazda", country: "Japan", engineStatus: .off, windowStatus: .dowm, maxSpeed: 300)

var honda: trunkCar = trunkCar(markAuto: "Honda", country: "Japan", engineStatus: .on, windowStatus: .up, cistern: 400)

mazda.actionWindow(windowStatus: .up)
mazda.actionEngine(engineStatus: .on)
honda.actionEngine(engineStatus: .on)

// 6. Вывести сами объекты в консоль.

print(mazda)
print(honda)
