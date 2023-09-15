func GCD(_ A: Int, _ B: Int) -> Int {
    if B == 0 {
        return A
    }
    
    return GCD(B, A % B)
}

var numberOfCommand = Int(readLine()!)!
var input = [[Int]](repeating: [Int](), count: numberOfCommand)

for index in 0..<input.count {
    input[index] = readLine()!.split(separator: " ").compactMap({Int($0)})
}

for countOfInputIndex in 0..<numberOfCommand {
    var gcdAccumulate = 0
    
    for index in 1..<input[countOfInputIndex].count {
        for secondIndex in (index + 1)..<input[countOfInputIndex].count {
            gcdAccumulate += GCD(input[countOfInputIndex][index], input[countOfInputIndex][secondIndex])
        }
    }
    
    print(gcdAccumulate)
}