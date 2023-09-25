let count = Int(readLine()!)!
var cost = readLine()!.split(separator: " ").compactMap{ Int($0) }
cost.insert(0, at: 0)

var result = [Int](repeating: 0, count: count + 1)
result[1] = cost[1]

for index in 2...count {
    result[index] = max(result[index - 1] + cost[1],
                        cost[index],
                        result[index])
    
    for subIndex in 1..<index {
        result[index] = max(result[index - subIndex] + result[subIndex], result[index])
    }
}

print(result[count])