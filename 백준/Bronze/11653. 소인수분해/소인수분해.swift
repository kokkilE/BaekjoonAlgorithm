var input = Int(readLine()!)!
var factors = [Int]()

while input > 1 {
    let currentInput = input
    
    for factor in 2..<input {
        if input % factor == 0 {
            factors.append(factor)
            input /= factor
            break
        }
    }
    
    if currentInput == input {
        factors.append(input)
        break
    }
}

factors.forEach { print($0) }