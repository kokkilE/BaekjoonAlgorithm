func solution(_ n: Int, _ array: [[Int]]) -> Int {
    var result = 1000 * 1000
    var dp = [[Int]](repeating: [0, 0, 0], count: n)
    
    for i in 0...2 {
        let a = (i + 1) % 3
        let b = (i + 2) % 3
        
        dp[0][i] = array[0][i]
        dp[0][a] = 1000 * 1000
        dp[0][b] = 1000 * 1000
        
        for j in 1..<n {
            dp[j][0] = min(dp[j-1][1], dp[j-1][2]) + array[j][0]
            dp[j][1] = min(dp[j-1][0], dp[j-1][2]) + array[j][1]
            dp[j][2] = min(dp[j-1][0], dp[j-1][1]) + array[j][2]
        }
        
        result = min(result, dp[n-1][a], dp[n-1][b])
    }
    
    return result
}

let n = Int(readLine()!)!
var array = [[Int]]()
for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").compactMap({ Int(String($0)) }))
}

let result = solution(n, array)
print(result)