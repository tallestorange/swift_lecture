let alphabets = ["a", "b", "c", "d", "e"]

for alphabet in alphabets[1...3] {
    print(alphabet) // "b", "c", "d"
}

for alphabet in alphabets.prefix(3) {
    print(alphabet) // "a", "b", "c"
}

for alphabet in alphabets.suffix(2) {
    print(alphabet) // "d", "e"
}

let alphabetsDict = ["a": 1, "b": 2, "c": 3]

for (key,value) in alphabetsDict {
    print(key, value) // 順序は保証されていない
}

for key in alphabetsDict.keys {
    print(key) // "a", "b", "c"
}

for value in alphabetsDict.values {
    print(value) // 1, 2, 3
}

3...6
