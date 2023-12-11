func solution(_ n: Int, _ wines: [Int]) -> Int {
    var dp = [Int](repeating: 0, count: n)
    
    if n == 1 { return wines[0] }
    if n == 2 { return wines[0] + wines[1] }
    
    dp[0] = wines[0]
    dp[1] = wines[0] + wines[1]
    dp[2] = max(wines[0] + wines[1], wines[0] + wines[2], wines[1] + wines[2])
    
    for index in 3..<n {
        dp[index] = max(dp[index - 3] + wines[index] + wines[index - 1],
                        dp[index - 2] + wines[index],
                        dp[index - 1])
    }
    
    return dp[n - 1]
}

// process input
let n = Int(readLine()!)!
var wines = [Int]()
for _ in 0..<n { wines.append(Int(readLine()!)!) }

let result = solution(n, wines)
print(result)