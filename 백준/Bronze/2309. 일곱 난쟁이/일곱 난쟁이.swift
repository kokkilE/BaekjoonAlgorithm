func solution(_ input: [Int]) -> [Int] {
    var answer = [Int]()
    var visited = [Int]()
    
    func generateCombination(_ startIndex: Int) {
        if visited.count == 7 {
            let sum = visited.reduce((0), { $0 + $1 })
            if sum == 100 {
                answer = visited
            }
        }
        
        for index in startIndex..<9 {
            if answer.count == 7 { return }
            
            visited.append(input[index])
            generateCombination(startIndex + 1)
            visited.removeLast()
        }
    }
    
    generateCombination(0)
    return answer.sorted(by: <)
}

var array = [Int]()
for _ in 0..<9 {
    array.append(Int(readLine()!)!)
}

solution(array).forEach { print($0) }