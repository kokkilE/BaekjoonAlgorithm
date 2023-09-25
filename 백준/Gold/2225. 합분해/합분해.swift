var input = readLine()!.split(separator: " ").compactMap({Int($0)})
let N = input[0]
let K = input[1]

var dp = [[Int]]()

for _ in 0...(N + 1) {
    dp.append([Int](repeating: 0, count: K + 1))
}

for index in 1...K {
    dp[1][index] = index
}

for n in 2...(N + 1) {
    for k in 1...K {
        for k_ in 1...k {
            dp[n][k] = (dp[n][k] + dp[n - 1][k_]) % 1000000000
        }
    }
}

print(dp[N].last! % 1000000000)