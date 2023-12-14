func solution(_ input: [Int]) -> Int {
    var year = 1
    var esm = [1, 1, 1]
    
    while input != esm {
        year += 1
        esm[0] = (esm[0] + 1) % 16
        esm[1] = (esm[1] + 1) % 29
        esm[2] = (esm[2] + 1) % 20
        
        if esm[0] == 0 { esm[0] = 1 }
        if esm[1] == 0 { esm[1] = 1 }
        if esm[2] == 0 { esm[2] = 1 }
    }
    
    return year
}

let array = readLine()!.split(separator: " ").compactMap({ Int($0) })
print(solution(array))