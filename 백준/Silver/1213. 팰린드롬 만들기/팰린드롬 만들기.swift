var name = readLine()!.compactMap({ String($0) })
var board = [Int](repeating: 0, count: 26)
var result = ""

name.forEach {
    board[Int(UnicodeScalar($0)!.value) - 65] += 1
}

if board.filter({ $0 % 2 == 1 }).count > 1 {
    print("I'm Sorry Hansoo")
} else {
    for index in 0...25 {
        while board[index] > 1 {
            result.append(String(UnicodeScalar(65 + index)!))
            board[index] -= 2
        }
    }
    
    if let center = board.firstIndex(of: 1) {
        result += String(UnicodeScalar(65 + center)!) + result.reversed()
    } else {
        result += result.reversed()
    }
    
    print(result)
}