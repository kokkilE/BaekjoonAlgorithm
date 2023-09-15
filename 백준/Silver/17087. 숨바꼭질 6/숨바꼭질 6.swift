func GCD(_ A: Int, _ B: Int) -> Int {
    if B == 0 {
        return A
    }
    
    return GCD(B, A % B)
}

var NS = readLine()!.split(separator: " ").compactMap({Int($0)})
var position = readLine()!.split(separator: " ").compactMap({Int($0)})
var distance = [Int]()

for index in 0..<NS[0] {
    distance.append(abs(NS[1] - position[index]))
}

var commonDistance = distance[0]

for index in 1..<NS[0] {
    commonDistance = GCD(commonDistance, distance[index])
}

print(commonDistance)