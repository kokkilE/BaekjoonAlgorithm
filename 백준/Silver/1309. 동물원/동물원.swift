var N = Int(readLine()!)!
var result = 0
var dp = [Int](repeating: 0, count: N + 1)

for n in 1...N {
    if n == 1 {
        dp[n] = 3
    } else if n == 2 {
        dp[n] = 7
    } else {
        dp[n] = (dp[n - 2] + dp[n - 1] * 2)  % 9901
    }
}

print(dp[N])