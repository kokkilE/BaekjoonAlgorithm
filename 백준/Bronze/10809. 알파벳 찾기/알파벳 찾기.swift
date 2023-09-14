let input = readLine()!
var alphabetCount = [Int](repeating: -1, count: 26)
var index = 0

input.forEach {
    let alphabetCountIndex = Character(extendedGraphemeClusterLiteral: $0).asciiValue! - Character("a").asciiValue!
    
    if alphabetCount[Int(alphabetCountIndex)] == -1 {
        alphabetCount[Int(alphabetCountIndex)] = index
    }
    
    index += 1
}

print(alphabetCount.map({String($0)}).joined(separator: " "))