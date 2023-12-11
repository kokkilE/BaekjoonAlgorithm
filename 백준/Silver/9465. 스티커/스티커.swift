func solution(_ n: Int, _ stickers: [[Int]]) -> Int {
    var endingTop = (sum: 0, lastValue: 0)
    var endingBottom = (sum: 0, lastValue: 0)
    
    for index in 0..<n {
        let savedEndingTop = endingTop
        
        if endingBottom.sum + stickers[0][index] >
            endingTop.sum - endingTop.lastValue + stickers[0][index] {
            endingTop.sum = endingBottom.sum + stickers[0][index]
            endingTop.lastValue = stickers[0][index]
        } else {
            endingTop.sum = endingTop.sum - endingTop.lastValue + stickers[0][index]
            endingTop.lastValue = stickers[0][index]
        }
        
        if savedEndingTop.sum + stickers[1][index] >
            endingBottom.sum - endingBottom.lastValue + stickers[1][index] {
            endingBottom.sum = savedEndingTop.sum + stickers[1][index]
            endingBottom.lastValue = stickers[1][index]
        } else {
            endingBottom.sum = endingBottom.sum - endingBottom.lastValue + stickers[1][index]
            endingBottom.lastValue = stickers[1][index]
        }
    }
    
    return endingTop.sum > endingBottom.sum ? endingTop.sum : endingBottom.sum
}

// process input
let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    var stickers = [[Int]]()
    stickers.append(readLine()!.split(separator: " ").compactMap { Int(String($0)) })
    stickers.append(readLine()!.split(separator: " ").compactMap { Int(String($0)) })
    
    let result = solution(n, stickers)
    print(result)
}