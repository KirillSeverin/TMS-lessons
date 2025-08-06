func findUnsortedSubarray(array: [Int]) -> Int {
    
    // для поиска максимального индекса
    var maxNum = array[0]
    var endIndex = 0
    
    // для поиска минимального индекса
    let n = array.count
    var minNum = array[n - 1]
    var startIndex = 1
    
    for (index, currentItem) in array.enumerated() {
        maxNum = max(maxNum, currentItem)
        if currentItem < maxNum {
            endIndex = index
            print("endIndex: \(endIndex)")
        }
    }
    
    for (index, _) in array.enumerated() {
        minNum = min(minNum, array[n - 1 - index])
        print("reverse array: \(array[n - 1 - index])")
        if array[n - 1 - index] > minNum {
            startIndex = n - 1 - index
            print("startIndex: \(startIndex)")
        }
    }
    return endIndex - startIndex + 1
}

findUnsortedSubarray(array: [1, 4, 2, 3, 2, 6])
findUnsortedSubarray(array: [3, 6, 8, 2, 4, 7, 2, 7, 23, 65])
findUnsortedSubarray(array: [1,1])
findUnsortedSubarray(array: [1,1,1,1,1])
