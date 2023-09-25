import Foundation

var input = Int(readLine()!)!
var dp = [Int](repeating: 100000, count: input + 1)
var squareRootNumbers = [Int]()

for index in 1...input {
    let squareRoot = Int(sqrt(Double(index)))
    if squareRoot * squareRoot == index {
        dp[index] = 1
        squareRootNumbers.append(index)
        continue
    }
    
    squareRootNumbers.forEach {
        if dp[index] > dp[$0] + dp[index - $0] {
            dp[index] = dp[$0] + dp[index - $0]
        }
    }
}

print(dp.last!)