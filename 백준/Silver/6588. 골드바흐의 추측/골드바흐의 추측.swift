func getSieveOfEratosthenes(target: Int) -> [Bool] {
    var result = [Bool](repeating: true, count: target + 1)
    result[0] = false
    result[1] = false
    result[2] = false
    
    for index in 3...target {
        if !result[index] { continue }
        
        for indexForExclude in stride(from: index * 2, through: target, by: index) {
            result[indexForExclude] = false
        }
    }
    
    return result
}

func printPrimeNumberAddExpression(target: Int) {
    for number in 3...(target - 1) {
        if sieveOfEratosthenes[number],
           sieveOfEratosthenes[target - number] {
            print("\(target) = \(number) + \(target - number)")
            return
        }
    }
    
    print("Goldbach's conjecture is wrong.")
}

let sieveOfEratosthenes = getSieveOfEratosthenes(target: 1000000)

while true {
    let input = Int(readLine()!)!
    if input == 0 { break }
    
    printPrimeNumberAddExpression(target: input)
}