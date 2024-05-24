--!Type(Module)

--[[
            This module script will not have any logic on it. Instead, it will be treated
            as a JSON, containing categories, difficulty, questions, answers and wheter if it is or
            is not correct.
--]]

testCategory = {
    easy = {
        meowQuestion = {
            baristDialoge = "Cats cats cats cats!",
            questionTxt = "Which of the following is a cat sound?",
            answers = {
                a = {txt = "qqqqqqqqq", truthValue = false},
                b = {txt = "wwwwwwwww", truthValue = false},
                c = {txt = "eeeeeeeee", truthValue = false},
                d = {txt = "meow :3", truthValue = true},
            },
        },
        giftQuestion = {
            baristDialoge = "Free points for you!",
            questionTxt = "This is 4 u",
            answers = {
                a = {txt = "nope", truthValue = false},
                b = {txt = "sorry, nope", truthValue = false},
                c = {txt = "This one!!! :D", truthValue = true},
                d = {txt = "Look for the happy one", truthValue = false},
            },
        },
        BarkQuestion = {
            baristDialoge = "Doggo doggo doggo doggo!",
            questionTxt = "Which of the following is a dog sound?",
            answers = {
                a = {txt = "qqqqqqqqq", truthValue = false},
                b = {txt = "wwwwwwwww", truthValue = false},
                c = {txt = "eeeeeeeee", truthValue = false},
                d = {txt = "Bark! ^°w°^", truthValue = true},
            },
        },
        testQuestion = {
            questionTxt = "Testing",
            baristDialoge = "Just testing!",
            answers = {
                a = {txt = "a", truthValue = false},
                b = {txt = "b", truthValue = false},
                c = {txt = "c", truthValue = false},
                d = {txt = "d, also correct", truthValue = true},
            },
        },
    },
    normal = {

    },
    hard = {

    },
}