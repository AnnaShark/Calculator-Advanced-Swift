//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Anna Shark on 14/9/21.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic  {
    
    private var number: Double?
    private var intermidiateCalculation: (firstNumber: Double, operation: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String)-> Double?{
        
        if let n = number {
            
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumberCalculation(secondNumber: n)
            default:
                intermidiateCalculation = (firstNumber: n, operation: symbol)
            }
        }

        return nil
        
    }
    
    private func performTwoNumberCalculation(secondNumber: Double) -> Double?{
        if let firstNumber = intermidiateCalculation?.firstNumber,
           let operation = intermidiateCalculation?.operation {

            switch operation {
            case "+":
                return firstNumber + secondNumber
            case "-":
                return  firstNumber - secondNumber
            case "×":
                return  firstNumber * secondNumber
            case "÷":
                return  firstNumber / secondNumber
            default:
                fatalError("error while performing operation")
            }
            
        }
        return nil
    }
    
    
}
