import Foundation

var count = Int(readLine()!)!
var input = readLine()!.components(separatedBy: " ").map{ Int($0)! }
var dp = [Int](repeating: 1, count: count) // dp 배열 초기화

for i in 1..<count {
    for j in 0..<i {
        if input[i] > input[j] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

let maxLength = dp.max() ?? 0 // dp 배열에서 최댓값 찾기
print(maxLength)