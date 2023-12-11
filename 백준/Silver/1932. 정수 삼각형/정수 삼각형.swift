func solution(_ n: Int, _ array: [[Int]]) -> Int {
    guard n >= 2 else { return array[0][0] }
    
    var dp = [[Int]]()
    for count in 1...n { dp.append([Int](repeating: 0, count: count)) }
    for index in 0..<n { dp[n - 1][index] = array[n - 1][index] }
    
    for line in stride(from: n - 2, to: -1, by: -1) {
        for index in 0..<dp[line].count {
            dp[line][index] = max(dp[line + 1][index] + array[line][index],
                                  dp[line + 1][index + 1] + array[line][index])
        }
    }
    
    return dp[0][0]
}

let n = Int(readLine()!)!
var array = [[Int]]()
for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").compactMap { Int(String($0)) })
}

let result = solution(n, array)
print(result)