// 유클리드 호제법:  A를 B로 나눈 몫을 Q라 하고, 나머지를 R이라 했을 때 이 때 A,B의 최대공약수는 B,R의 최대공약수와 같다는 정수론
func getGreatestCommondivisor(_ lhs: Int, _ rhs: Int) -> Int {
    if rhs == 0 {
        return lhs
    }
    
    return getGreatestCommondivisor(rhs, lhs % rhs)
}

// A * B = GCD * LCM과 같다
func getLeastCommonMultiple(_ lhs: Int, _ rhs: Int) -> Int {
    return (lhs * rhs) / getGreatestCommondivisor(lhs, rhs)
}

var input = [[Int]]()

for _ in 0..<Int(readLine()!)! {
    input.append(readLine()!.split(separator: " ").map({Int($0)!}))
}

input.forEach {
    print(getLeastCommonMultiple($0[0], $0[1]))
}