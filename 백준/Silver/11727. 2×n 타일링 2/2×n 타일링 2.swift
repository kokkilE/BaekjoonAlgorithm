var input = Int(readLine()!)!
var result = [Int](repeating: 0, count: input + 3)
result[1] = 1
result[2] = 3

for index in 3..<result.count {
    result[index] = (result[index - 1] + (result[index - 2] * 2)) % 10007
}

print(result[input])