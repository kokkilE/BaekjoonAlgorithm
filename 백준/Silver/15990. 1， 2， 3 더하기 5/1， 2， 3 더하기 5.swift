let count = Int(readLine()!)!
var input = [Int]()
for _ in 0..<count {
    input.append(Int(readLine()!)!)
}

var F = [[Int]](repeating: [0, 0, 0, 0], count: 100000 + 1)
F[1][1] = 1
F[2][2] = 1
F[3][1] = 1
F[3][2] = 1
F[3][3] = 1

for index in 4...100000 {
    F[index][1] = (F[index - 1][3] + F[index - 1][2]) % 1000000009
    F[index][2] = (F[index - 2][1] + F[index - 2][3]) % 1000000009
    F[index][3] = (F[index - 3][1] + F[index - 3][2]) % 1000000009
}

input.forEach {
    print((F[$0][1] + F[$0][2] + F[$0][3]) % 1000000009)
}