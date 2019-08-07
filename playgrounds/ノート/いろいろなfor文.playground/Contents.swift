/*:
 # いろいろなfor文
 ## 配列編
 */

let alphabets = ["a", "b", "c", "d", "e"]

/*:
 部分列がほしいときは 配列[選択範囲] とすることで部分列が取得できます.
 */

for alphabet in alphabets[1...3] {
    print(alphabet) // "b", "c", "d"
}

/*:
 先頭からn要素が欲しい場合は, 配列.prefix(n)とすることで取得できます.
 */

for alphabet in alphabets.prefix(3) {
    print(alphabet) // "a", "b", "c"
}

/*:
 後ろからn要素が欲しい場合は, 配列.suffix(n)とすることで取得できます.
 */

for alphabet in alphabets.suffix(2) {
    print(alphabet) // "d", "e"
}

/*:
 ## 辞書編
 */

let alphabetsDict = ["a": 1, "b": 2, "c": 3]

/*:
 for (キー, 値) in 辞書 とすることで辞書のキーと値の両方を取得できます.
 
 ちなみに, for文で取り出す際の順序は特に保証されていないので注意が必要です.
 */

for (key,value) in alphabetsDict {
    print(key, value) // 順序は保証されていない
}

/*:
 for キー in 辞書.keys とすることで辞書のキーを取得できます.
 */

for key in alphabetsDict.keys {
    print(key) // "a", "b", "c"
}

/*:
 for 値 in 辞書.values とすることで辞書の値を取得できます.
 */

for value in alphabetsDict.values {
    print(value) // 1, 2, 3
}
