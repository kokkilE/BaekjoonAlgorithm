let input = readLine()!
var alphabetCount = [Int](repeating: 0, count: 26)

input.forEach {
    let index = Character(extendedGraphemeClusterLiteral: $0).asciiValue! - Character("a").asciiValue!
    
    alphabetCount[Int(index)] += 1
}

print(alphabetCount.map({String($0)}).joined(separator: " "))