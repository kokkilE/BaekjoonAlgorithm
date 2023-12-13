func solution(_ n: Int) -> Int {
    guard n > 1, n % 2 == 0 else { return 0 }
    guard n != 2 else { return 3 }
    
    var result = [Int](repeating: 0, count: n + 1)
    result[2] = 3
    result[4] = 11
    
    for index in stride(from: 6, to: n + 1, by: +2) {
        result[index] = result[index - 2] * 4 - result[index - 4]
    }
    
    return result[n]
}

let n = Int(readLine()!)!

let result = solution(n)
print(result)