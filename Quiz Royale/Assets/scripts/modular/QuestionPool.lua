--!Type(Module)

--[[
            This module script will not have any logic on it. Instead, it will be treated
            as a JSON, containing categories, difficulty, questions, answers and wheter if it is or
            is not correct.
--]]

testCategory = {
    easy = {
        [1] = {
            baristDialoge = "Cats cats cats cats!",
            questionTxt = "Which of the following is a cat sound?",
            answers = {
                a = {txt = "qqqqqqqqq", truthValue = false},
                b = {txt = "wwwwwwwww", truthValue = false},
                c = {txt = "eeeeeeeee", truthValue = false},
                d = {txt = "meow :3", truthValue = true},
            },
            asked = false;
        },
        [2] = {
            baristDialoge = "Free points for you!",
            questionTxt = "This is 4 u",
            answers = {
                a = {txt = "nope", truthValue = false},
                b = {txt = "sorry, nope", truthValue = false},
                c = {txt = "This one!!! :D", truthValue = true},
                d = {txt = "Look for the happy one", truthValue = false},
            },
            asked = false;
        },
        [3] = {
            baristDialoge = "Doggo doggo doggo doggo!",
            questionTxt = "Which of the following is a dog sound?",
            answers = {
                a = {txt = "qqqqqqqqq", truthValue = false},
                b = {txt = "wwwwwwwww", truthValue = false},
                c = {txt = "eeeeeeeee", truthValue = false},
                d = {txt = "Bark! ^°w°^", truthValue = true},
            },
            asked = false;
        },
        [4] = {
            questionTxt = "Testing",
            baristDialoge = "Just testing!",
            answers = {
                a = {txt = "a", truthValue = false},
                b = {txt = "b", truthValue = false},
                c = {txt = "c", truthValue = false},
                d = {txt = "d, also correct", truthValue = true},
            },
            asked = false;
        },
        [5] = {
            questionTxt = "Is water wet?",
            baristDialoge = "Question about water",
            answers = {
                a = {txt = "What?", truthValue = false},
                b = {txt = "What do you mean?", truthValue = false},
                c = {txt = "uh...", truthValue = false},
                d = {txt = "I guess?", truthValue = true},
            },
            asked = false;
        },
        [6] = {
            questionTxt = "Every answer is correct",
            baristDialoge = "There's only one way to get this wrong: not answering",
            answers = {
                a = {txt = "uwu", truthValue = true},
                b = {txt = ":3", truthValue = true},
                c = {txt = "Rawr!", truthValue = true},
                d = {txt = "x3", truthValue = true},
            },
            asked = false;
        },
    },
    normal = {
        [1] = {
            questionTxt = "How is coffe served?",
            baristDialoge = "This one is about here!",
            answers = {
                a = {txt = "Hot", truthValue = true},
                b = {txt = "Cold", truthValue = false},
                c = {txt = "Kinda warm?", truthValue = false},
                d = {txt = "I ATE THE MOON", truthValue = false},
            },
            asked = false;
        },
        [2] = {
            questionTxt = "Are ponies cute?",
            baristDialoge = "We're talking about small strong horses now.",
            answers = {
                a = {txt = "Yes!", truthValue = true},
                b = {txt = "Cuteness is a social construct [muchotexto]", truthValue = false},
                c = {txt = "What is a pony but a [muchotexto]", truthValue = false},
                d = {txt = "No.", truthValue = false},
            },
            asked = false;
        },
        [3] = {
            questionTxt = "Is mayo an instrument?",
            baristDialoge = "Have you seen Squarepants Spongebob?",
            answers = {
                a = {txt = "Yes!", truthValue = false},
                b = {txt = "This questions are weird", truthValue = false},
                c = {txt = "*Puts mayo in sandwich*", truthValue = false},
                d = {txt = "No, Patrick. Mayonnaise is not an instrument.", truthValue = true},
            },
            asked = false;
        },
        [4] = {
            questionTxt = "Which animal is know for being a good boy?",
            baristDialoge = "Do you have a pet?",
            answers = {
                a = {txt = "Fishes", truthValue = false},
                b = {txt = "Dolphins", truthValue = false},
                c = {txt = "Dogs", truthValue = true},
                d = {txt = "Cats", truthValue = false},
            },
            asked = false;
        },
        [5] = {
            questionTxt = "What are you?",
            baristDialoge = "I hope you like philosophy.",
            answers = {
                a = {txt = "Not straight?", truthValue = false},
                b = {txt = "Why do you ask?", truthValue = false},
                c = {txt = "Human?", truthValue = true},
                d = {txt = "It depends, who asks?", truthValue = false},
            },
            asked = false;
        },
    },
    hard = {
        [1] = {
            questionTxt = "You can't get this right.",
            baristDialoge = "Sorry, it is part of the test.",
            answers = {
                a = {txt = "What?", truthValue = false},
                b = {txt = "Why?", truthValue = false},
                c = {txt = ":c", truthValue = false},
                d = {txt = "u,w,u", truthValue = false},
            },
            asked = false;
        },
        [2] = {
            questionTxt = "What is Vylet Pony?",
            baristDialoge = "I'd be glad if you knew this one.",
            answers = {
                a = {txt = "My Little Pony character", truthValue = false},
                b = {txt = "A president's daughter pony", truthValue = false},
                c = {txt = "A musician", truthValue = true},
                d = {txt = "A song from the 'White Pony' album", truthValue = false},
            },
            asked = false;
        },
        [3] = {
            questionTxt = "What is the main ingredient of Toriel's pie?",
            baristDialoge = "Have you played Undertale?",
            answers = {
                a = {txt = "Leamon", truthValue = false},
                b = {txt = "Cinnamon", truthValue = true},
                c = {txt = "Lime", truthValue = false},
                d = {txt = "She bakes cake, not pie", truthValue = false},
            },
            asked = false;
        },
        [4] = {
            questionTxt = "Where comes the 'the cake is a lie' meme come from?",
            baristDialoge = "I hope you have played a lot of videogames.",
            answers = {
                a = {txt = "Cooking Mama", truthValue = false},
                b = {txt = "Portal", truthValue = true},
                c = {txt = "League of Legends", truthValue = false},
                d = {txt = "Overcooked", truthValue = false},
            },
            asked = false;
        },
        [5] = {
            questionTxt = "Could you tell me how do you find a C note in a piano?",
            baristDialoge = "I took leasons once, but i forgot...",
            answers = {
                a = {txt = "It is the first white key of any piano", truthValue = false},
                b = {txt = "It is the white key before a group of two black keys", truthValue = true},
                c = {txt = "It is the first black key of every piano", truthValue = false},
                d = {txt = "It is the white key before a group of three black keys", truthValue = false},
            },
            asked = false;
        },
    },
}