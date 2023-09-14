import Foundation

func operatorPriority(_ data: Character, isInParenthesis: Int) -> Int {
    var priority = 0
    
    switch data {
    case "/", "*":
        priority += 2
    case "+", "-":
        priority += 1
    default:
        break
    }
    
    return priority + isInParenthesis
}

let expression = readLine()!.map({$0})
var operandStack = [Character]()
var operatorStack = [Character]()
var operatorPriorityStack = [Int]()

var postfixExpression = ""
var isInParenthesis = 0

expression.forEach {
    switch $0 {
    case "+", "-", "/", "*":
        // 연산자 스택이 비어있으면 연산하지 않음
        if operatorPriorityStack.isEmpty {
            operatorStack.append($0)
            operatorPriorityStack.append(operatorPriority($0, isInParenthesis: isInParenthesis))
        }
        // 현재 연산 우선순위가 기존보다 낮으면 기존의 연산자를 연산
        else if operatorPriority($0, isInParenthesis: isInParenthesis) <= operatorPriorityStack.last! {
            while !operandStack.isEmpty {
                postfixExpression.append(operandStack.removeFirst())
            }
            
            while let priority = operatorPriorityStack.last,
                  operatorPriority($0, isInParenthesis: isInParenthesis) <= priority {
                postfixExpression.append(operatorStack.removeLast())
                operatorPriorityStack.popLast()
            }
            
            operatorStack.append($0)
            operatorPriorityStack.append(operatorPriority($0, isInParenthesis: isInParenthesis))
        } else {
            operatorStack.append($0)
            operatorPriorityStack.append(operatorPriority($0, isInParenthesis: isInParenthesis))
        }
        
    case "(":
        isInParenthesis += 2
    case ")":
        isInParenthesis -= 2
    default:
        operandStack.append($0)
    }
}

while !operandStack.isEmpty {
    postfixExpression.append(operandStack.removeFirst())
}

while !operatorStack.isEmpty {
    postfixExpression.append(operatorStack.removeLast())
}

print(postfixExpression)