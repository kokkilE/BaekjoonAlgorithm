let input = readLine()!.split(separator: " ").compactMap({Int($0)})
var n = input[0] > input[1] ? input[0] : input[1]
var m = input[0] > input[1] ? input[1] : input[0]
var m_ = n - m

let n2Count = getFactorCount(factor: 2, number: n)
let n5Count = getFactorCount(factor: 5, number: n)
let m2Count = getFactorCount(factor: 2, number: m) + getFactorCount(factor: 2, number: m_)
let m5Count = getFactorCount(factor: 5, number: m) + getFactorCount(factor: 5, number: m_)

var count = min(n2Count - m2Count, n5Count - m5Count)
print(count)

func getFactorCount(factor: Int, number: Int) -> Int {
    var count = 0
    var currentNumber = number
    
    while currentNumber > 0 {
        count += (currentNumber / factor)
        currentNumber /= factor
    }
    
    return count
}