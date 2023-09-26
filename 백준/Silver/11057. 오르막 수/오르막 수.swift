var N = Int(readLine()!)!
var dp = [[Int]](repeating: [Int](repeating: 0, count: 10), count: N + 1)

for n in 1...N {
    for endNumber in 0...9 {
        if n == 1 {
            dp[n][endNumber] = 1
            continue
        }
        
        for j in 0...endNumber {
            dp[n][endNumber] += dp[n - 1][j] % 10007
        }
    }
}

var result = 0
dp[N].forEach { result += $0 % 10007 }
print(result % 10007)