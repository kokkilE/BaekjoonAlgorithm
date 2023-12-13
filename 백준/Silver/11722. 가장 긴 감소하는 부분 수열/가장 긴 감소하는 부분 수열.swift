func solution(_ n: Int, _ array: [Int]) -> Int {
    var result = [Int](repeating: 1, count: n)
    
    for i in 1..<n {
        for j in 0..<i {
            if array[i] < array[j] {
                result[i] = max(result[i], result[j] + 1)
            }
        }
    }

    return result.max()!
}

let n = Int(readLine()!)!
let array = [Int]((readLine()!.split(separator: " ").compactMap { Int(String($0)) }))

let result = solution(n, array)
print(result)