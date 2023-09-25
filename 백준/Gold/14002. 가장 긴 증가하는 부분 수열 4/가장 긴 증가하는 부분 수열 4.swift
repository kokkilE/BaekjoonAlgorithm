var count = Int(readLine()!)!
var input = readLine()!.split(separator: " ").compactMap { Int($0) }
var dp = [[Int]](repeating: [Int](), count: count + 1)

for index in 0..<count {
    dp[index].append(input[index])
}

for index in 1..<count {
    for subIndex in 0..<index {
        if input[index] > input[subIndex] {
            if dp[index].count <= dp[subIndex].count + 1 {
                dp[index] = dp[subIndex]
                dp[index].append(input[index])
            }
        }
    }
}

dp.sort(by: { $0.count > $1.count })
print(dp.first!.count)
for index in 0..<(dp.first!.count - 1) {
    print(dp.first![index], terminator: " ")
}
print(dp.first!.last!)