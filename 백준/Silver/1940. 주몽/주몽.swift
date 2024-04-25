func solution() -> Int {
    let _ = readLine()!
    let M = Int(readLine()!)!
    let input = readLine()!.split(separator: " ").compactMap({ Int($0) })
    var materials = [Int](repeating: 0, count: 100001)
    var result = 0
    if M < 2 { return result }
    
    input.forEach { materials[$0] += 1 }
    
    for index in 1...(M / 2) {
        if index > M || index * 2 == M || index > 50000 || M - index > 100000 { break }
        if materials[index] + materials[M - index] == 2 {
            result += 1
        }
    }
    
    return result
}

print(solution())