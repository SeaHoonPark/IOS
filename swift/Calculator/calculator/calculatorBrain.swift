//
//  calculatorBrain.swift
//  calculator
//
//  Created by 박세훈 on 2018. 3. 3..
//  Copyright © 2018년 박세훈. All rights reserved.
//

import Foundation

class CacluatorBrain
{
    private var accumulator = 0.0
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    private var operations: Dictionary<String,Operation> = [ //앱에서 연산자 계산하는 부분(빌드 후)
        "π" : Operation.Constant(Double.pi),
        "e" : Operation.Constant(M_E),
        "√" : Operation.UnaryOperation(sqrt),
        "cos" : Operation.UnaryOperation(cos),
        "✖️" : Operation.BinaryOperation({ $0 * $1 }),
        "➗" : Operation.BinaryOperation({ $0 / $1 }),
        "➕" : Operation.BinaryOperation({ $0 + $1 }),
        "➖" : Operation.BinaryOperation({ $0 - $1 }),
        "=" : Operation.Equals,
        ]
    
    private enum Operation { //코드 부분에서 계산하는 부분(빌드 전)
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }
    func performOperation(symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .Constant(let value):
                accumulator = value
            case .UnaryOperation(let funtion):
                accumulator = funtion(accumulator)
            case .BinaryOperation(let funtion):
                executePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(bindingFunction: funtion, firstOperand: accumulator)
            case .Equals:
                executePendingBinaryOperation()
            }
        }
    }
    
    private func executePendingBinaryOperation(){
        if pending != nil{
            accumulator = pending!.bindingFunction(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
    
    private var pending: PendingBinaryOperationInfo?
    
    private struct PendingBinaryOperationInfo {
        var bindingFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
    var result: Double{
        get {
            return accumulator
        }
    }
}
