func solution(_ n: Int, _ array: [Int]) -> Int {
    guard n > 1 else { return array[0] }
    
    // result[0][index] : 숫자를 제거하지 않는 연속합의 최대값
    // result[1][index] : 숫자 제거를 고려한 연속합의 최대값
    var result = [[Int]](repeating: array, count: 2)
    result[0][1] = max(result[0][1], result[0][0] + array[1])
    
    for index in 2..<n {
        result[0][index] = max(result[0][index], result[0][index-1] + array[index])
        result[1][index] = max(result[1][index], 
                           result[1][index-1] + array[index],
                           result[0][index-2] + array[index])
    }
    
    return max(result[0].max()!, result[1].max()!)
}

let n = Int(readLine()!)!
let array = [Int]((readLine()!.split(separator: " ").compactMap { Int(String($0)) }))

let result = solution(n, array)
print(result)