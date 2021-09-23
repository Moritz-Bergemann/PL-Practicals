'hellow world!' printNl

1 to: 100 do: [:x |
    (x \\ 15 == 0)
        ifTrue: [
            'fizzbuzz' displayNl.
        ]
        ifFalse: [
            (x \\ 3 == 0)
                ifTrue: [
                    'fizz' displayNl.
                ]
                ifFalse: [
                    (x \\ 5 == 0)
                        ifTrue: [
                            'buzz' displayNl.
                        ]
                        ifFalse: [
                            x displayNl.
                        ]
                ]
        ]
].