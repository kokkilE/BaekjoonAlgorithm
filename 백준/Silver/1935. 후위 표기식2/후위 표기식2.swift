import Foundation

let numberOfInput = Int(readLine()!)!
var expression = readLine()!.map({String($0)})
var operandStack = [Double]()

for _ in 0..<numberOfInput {
    let operand = Int(readLine()!)!
    
    for index in expression.indices {
        if expression[index] == "+" || expression[index] == "/" || expression[index] == "*" || expression[index] == "-" {
            continue
        }
        
        if Double(expression[index]) != nil {
            continue
        }
        
        let sameCharacter = expression[index]
        while expression.contains(sameCharacter) {
            let serchedIndex = expression.firstIndex(where: {$0 == sameCharacter})
            expression[serchedIndex!] = String(operand)
        }
        break
    }
}

expression.forEach {
    switch $0 {
    case "+":
        operandStack.append(operandStack.removeLast() + operandStack.removeLast())
    case "-":
        let operand = operandStack.removeLast()
        operandStack.append(operandStack.removeLast() - operand)
    case "/":
        let operand = operandStack.removeLast()
        operandStack.append(operandStack.removeLast() / operand)
    case "*":
        operandStack.append(operandStack.removeLast() * operandStack.removeLast())
    default:
        operandStack.append(Double($0)!)
    }
}

print(String(format: "%.2f", operandStack.removeLast()))