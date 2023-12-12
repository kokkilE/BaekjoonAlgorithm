func solution(_ n: Int, _ array: [Int]) -> Int {
    var result = [Int](repeating: 0, count: n)
    result[0] = array[0]
    
    for index in 1..<n {
        for j in 0..<index {
            if array[index] > array[j] {
                result[index] = max(result[index], result[j] + array[index])
            } else {
                result[index] = max(result[index], array[index])
            }
        }
    }

    return result.max()!
}

let n = Int(readLine()!)!
let array = [Int]((readLine()!.split(separator: " ").compactMap { Int(String($0)) }))

let result = solution(n, array)
print(result)