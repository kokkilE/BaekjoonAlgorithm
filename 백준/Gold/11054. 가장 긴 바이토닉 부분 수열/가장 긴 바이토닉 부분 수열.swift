func solution(_ n: Int, _ array: [Int]) -> Int {
    var increasing = [Int](repeating: 1, count: n)
    var decreasing = [Int](repeating: 1, count: n)
    
    for i in 0..<n {
        for j in 0..<i {
            if array[i] > array[j] {
                increasing[i] = max(increasing[i], increasing[j] + 1)
            }
        }
    }
    
    for i in stride(from: n - 1, to: -1, by: -1) {
        for j in stride(from: n - 1, to: i, by: -1) {
            if array[i] > array[j] {
                decreasing[i] = max(decreasing[i], decreasing[j] + 1)
            }
        }
    }
    
    var result = 0
    for i in 0..<n {
        result = max(result, increasing[i] + decreasing[i] - 1)
    }
    
    return result
}

let n = Int(readLine()!)!
let array = [Int]((readLine()!.split(separator: " ").compactMap { Int(String($0)) }))

let result = solution(n, array)
print(result)