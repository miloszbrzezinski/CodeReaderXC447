//
//  CodeArray.swift
//  XC447 Code Reader
//
//  Created by Milosz Brzezinski on 23/11/2022.
//

import Foundation

class CodeArray: ObservableObject{
    @Published var codeArray = [CodeBit]()
    
    
    init(){
        for _ in 0...15{
            codeArray.append(CodeBit(value: false))
        }
    }
    
    func getDecValue() -> Int {
        var v = 0
        var pow = 0
        for i in codeArray{
            if i.value {
                v += 2 ^^ pow
            }
            pow += 1
        }
        return v
    }
    
    func getBinValue() -> String {
        var binValue = ""
        var int = 0
        for i in codeArray{
            if i.value{
                binValue += "1"
            }else{
                binValue += "0"
            }
            if int == 3{
                binValue += " "
                int = 0
            }else{
                int += 1
            }
            
        }
        return String(binValue.reversed())
    }
    
    func clearArray(){
        codeArray = [CodeBit]()
        for _ in 0...15{
            codeArray.append(CodeBit(value: false))
        }
    }
    


    
    
}


precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ^^ : PowerPrecedence
func ^^ (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}
