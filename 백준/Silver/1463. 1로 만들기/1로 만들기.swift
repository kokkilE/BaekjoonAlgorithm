var input = Int(readLine()!)!

var archive = [Int](repeating: 0, count: 1000001)
func getCountToOne(_ number: Int) -> Int {
    if archive[number] != 0 { return archive[number] }
    
    if number == 1 {
        return 0
    } else if number == 2, number == 3 {
        return 1
    } else {
        if number % 3 == 0,
           number % 2 != 0 {
            archive[number] = 1 + min(getCountToOne(number / 3),getCountToOne(number - 1))
            return archive[number]
        } else if number % 3 != 0,
                  number % 2 == 0 {
            archive[number] = 1 + min(getCountToOne(number - 1),
                           getCountToOne(number / 2))
            return archive[number]
        } else if number % 3 == 0,
                  number % 2 == 0 {
            archive[number] = 1 + min(getCountToOne(number / 3),
                           getCountToOne(number / 2))
            return archive[number]
        } else {
            archive[number] = 1 + getCountToOne(number - 1)
            return archive[number]
        }
    }
}

print(getCountToOne(input))