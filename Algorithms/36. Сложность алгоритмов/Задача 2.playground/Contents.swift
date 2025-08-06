func removeDuplicates(array: inout [Int]) -> Int {
    
    var last: Int?
    var index: Int = 0
    
    while index < array.count { // идем по массиву
        if array[index] == last { // в первый раз просускаем
            array.remove(at: index) // index не увеличиваем
        } else {
            last = array[index] // записываем
            index += 1 // увеличиваем index
        }
    }
    return array.count
}

var array = [0, 0, 1, 1, 3, 4, 4, 4, 5, 5, 8]
removeDuplicates(array: &array)
print(array)





