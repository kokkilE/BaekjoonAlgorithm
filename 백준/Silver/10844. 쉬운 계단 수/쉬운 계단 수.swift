var input = Int(readLine()!)!

var N = [[Int]](repeating: [Int](repeating: 0, count: 10), count: input + 2)
N[1][0] = 0
for index in 1...9 {
    N[1][index] = 1
}

for index in 2...(input + 1) {
    N[index][0] = N[index-1][1] % 1000000000
    N[index][1] = (N[index-1][0] + N[index-1][2]) % 1000000000
    N[index][2] = (N[index-1][1] + N[index-1][3]) % 1000000000
    N[index][3] = (N[index-1][2] + N[index-1][4]) % 1000000000
    N[index][4] = (N[index-1][3] + N[index-1][5]) % 1000000000
    N[index][5] = (N[index-1][4] + N[index-1][6]) % 1000000000
    N[index][6] = (N[index-1][5] + N[index-1][7]) % 1000000000
    N[index][7] = (N[index-1][6] + N[index-1][8]) % 1000000000
    N[index][8] = (N[index-1][7] + N[index-1][9]) % 1000000000
    N[index][9] = N[index-1][8] % 1000000000
}

print((N[input][0] + N[input][1] + N[input][2] + N[input][3] + N[input][4] +
       N[input][5] + N[input][6] + N[input][7] + N[input][8] + N[input][9]) % 1000000000)