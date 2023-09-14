import Foundation

func isPrimeNumber(_ number: Int) -> Bool {
    if number == 2 || number == 3 { return true }
    if number <= 1 { return false }
    
    for divisor in 2...Int(sqrt(Double(number))) {
        if number % divisor == 0 { return false }
    }
    
    return true
}

func getPrimeNumber(between lhs: Int, and rhs: Int) -> [Int] {
    var primeNumber = [Int]()
    
    for number in lhs...rhs {
        if isPrimeNumber(number) { primeNumber.append(number) }
    }
    
    return primeNumber
}

var input = readLine()!.split(separator: " ").map({Int($0)!})
let result = getPrimeNumber(between: input[0], and: input[1])

result.forEach { print($0) }