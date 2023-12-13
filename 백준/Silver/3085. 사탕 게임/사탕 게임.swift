func solution(_ n: Int, _ input: [[Character]]) -> Int {
    let maxIndex = n - 1
    var result = 0
    
    func getCount(_ array: [[Character]]) -> Int {
        var currentCount = 1
        var maxCount = 0
        
        for i in 0...maxIndex {
            currentCount = 1
            
            for j in 0..<maxIndex {
                if array[i][j] == array[i][j + 1] {
                    currentCount += 1
                } else {
                    maxCount = max(maxCount, currentCount)
                    currentCount = 1
                }
            }
            
            maxCount = max(maxCount, currentCount)
        }
        
        for i in 0...maxIndex {
            currentCount = 1
            
            for j in 0..<maxIndex {
                if array[j][i] == array[j + 1][i] {
                    currentCount += 1
                } else {
                    maxCount = max(maxCount, currentCount)
                    currentCount = 1
                }
            }
            
            maxCount = max(maxCount, currentCount)
        }
        
        return maxCount
    }
    
    for i in 0...maxIndex {
        for j in 0..<maxIndex {
            var array = input
            var tempValue = array[j][i]
            array[j][i] = array[j + 1][i]
            array[j + 1][i] = tempValue
            
            result = max(result, getCount(array))
            
            array = input
            tempValue = array[i][j]
            array[i][j] = array[i][j + 1]
            array[i][j + 1] = tempValue
            
            result = max(result, getCount(array))
        }
    }

    return result
}

let n = Int(readLine()!)!
var array = [[Character]]()
for _ in 0..<n { array.append(readLine()!.map({ Character(String($0)) })) }

print(solution(n, array))