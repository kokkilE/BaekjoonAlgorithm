let count = Int(readLine()!)!
var input = [[Int]]()

for _ in 0..<count {
    input.append(readLine()!.split(separator: " ").compactMap({ Int($0) }))
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: count)
dp[0][0] = input[0][0]
dp[0][1] = input[0][1]
dp[0][2] = input[0][2]

for index in 1..<count {
    dp[index][0] = min(dp[index - 1][1], dp[index - 1][2]) + input[index][0]
    dp[index][1] = min(dp[index - 1][0], dp[index - 1][2]) + input[index][1]
    dp[index][2] = min(dp[index - 1][0], dp[index - 1][1]) + input[index][2]
}

print(min(dp[count - 1][0], dp[count - 1][1], dp[count - 1][2]))