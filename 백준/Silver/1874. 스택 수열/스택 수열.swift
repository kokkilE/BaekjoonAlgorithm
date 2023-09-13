final class Stack {
    private var data = [Int]()
    private var history = ""
    
    func contains(_ target: Int) -> Bool {
        return data.contains(target)
    }
    
    func push(_ newData: Int) {
        history.append("+")
        data.append(newData)
    }
    
    @discardableResult
    func pop() -> Int? {
        history.append("-")
        return data.popLast()
    }
    
    func printHistroy() {
        history.forEach {
            print($0)
        }
    }
}

func solve() {
    let numberOfInput = Int(readLine()!)!
    var input = [Int]()
    
    for _ in 0..<numberOfInput {
        let eachLineInput = Int(readLine()!)!
        input.append(eachLineInput)
    }
    
    let stack = Stack()
    var currentNumber = 0
    
    for target in input {
        if !stack.contains(target) {
            if target < currentNumber {
                print("NO")
                return
            }
            
            while target != currentNumber {
                currentNumber += 1
                stack.push(currentNumber)
                
                if currentNumber > numberOfInput {
                    print("NO")
                    return
                }
            }
        }
        
        stack.pop()
    }
    
    stack.printHistroy()
}

solve()