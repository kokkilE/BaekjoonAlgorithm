var numberOfInput = Int(readLine()!)!
var input = [Int]()
for _ in 0..<numberOfInput {
    input.append(Int(readLine()!)!)
}

var primeSeive = [Bool](repeating: true, count: 1000001)
primeSeive[0] = false
primeSeive[1] = false
for index in 2...1000000 {
    if !primeSeive[index] { continue }

    for indexForFalse in stride(from: index * 2, through: 1000000, by: index) {
        primeSeive[indexForFalse] = false
    }
}

func printCount(_ target: Int) {
    var count = 0
    
    for index in 2..<target {
        if primeSeive[index], primeSeive[target - index] {
            count += 1
        }
    }
    
    if count % 2 == 1 {
        print((count + 1) / 2)
        
        return
    }
    
    print(count / 2)
}

input.forEach {
    printCount($0)
}