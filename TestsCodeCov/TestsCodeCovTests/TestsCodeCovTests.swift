//
//  TestsCodeCovTests.swift
//  TestsCodeCovTests
//
//  Created by Lev Bondarenko on 07.06.2023.
//

import XCTest
@testable import TestsCodeCov

class UnitTestExampleTests: XCTestCase {
    
    // создаём объект, который будем использовать в тестах
    var coffee: Coffee!

    override func setUpWithError() throws {
        try super.setUpWithError()
        // в данном методе, который запускается перед началом тестов, инициируем объект в виде класа, что позволит нам обращаться к его свойствам и методам
        coffee = Coffee()
    }

    override func tearDownWithError() throws {
        // убираем объект из памяти после окончания теста, освобождая память для запуска следующих тестов
        coffee = nil
        try super.tearDownWithError()
    }

    // метод самого теста
    func testExample() throws {
        
        let sugar = 2
        
        // "готовим" две кружки кофе, американо и капучино, каждая имеет различный состав ингридиентов, которые прописаны в соответствующих методах класа Coffee
        coffee.makeCoffee(coffee: .cappuccino, sugar: sugar)
        coffee.makeCoffee(coffee: .americano, sugar: 0)
        
        // проверяем статус готовности. тест пройдёт если утверждение будет true
        XCTAssert(coffee.status, "статус приготовления кофе")
        
        // проверяем корректность использования ингридиентов для готовки двух кружек кофе
        // на примере молока, сравниваем использованное количество молока с тем, которое реально должно было израсходоваться
        XCTAssertEqual(coffee.milk, 1, "добавление молока")
        XCTAssertEqual(coffee.water, 2, "добавление воды")
        XCTAssertEqual(coffee.groundCoffee, 2, "добавление молотого кофе")
        XCTAssertEqual(coffee.sugar, 2, "добавление сахара")

    }

    // метод тестирования скорости выполнения определённого блока кода
    func testPerformanceExample() throws {
        
        let sugar = 2
        
        measure {
            coffee.makeCoffee(coffee: .cappuccino, sugar: sugar)
        }
    }
}
