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

travel = {
    easy = {
        {
            baristDialoge = "I've seen many wonders. I'd love to time travel so I could visit Ancient World ones.",
            questionTxt = "How many World Wonders are there for the Ancient World?",
            answers = {
                a = {txt = "Five", truthValue = false},
                b = {txt = "Ten", truthValue = false},
                c = {txt = "Three", truthValue = false},
                d = {txt = "Seven", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "When it was built, it was the highest building in the world.",
            questionTxt = "Where is Eiffel Tower located?",
            answers = {
                a = {txt = "Prague", truthValue = false},
                b = {txt = "Venice", truthValue = false},
                c = {txt = "Lisboa", truthValue = false},
                d = {txt = "Paris", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "Do you think it'd be nice selling sushi here?",
            questionTxt = "What is the capital of Japan?",
            answers = {
                a = {txt = "Kyoto", truthValue = false},
                b = {txt = "Osaka", truthValue = false},
                c = {txt = "Hiroshima", truthValue = false},
                d = {txt = "Tokio", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "Despite how cute they are, kangaroos are pretty dangerous.",
            questionTxt = "Where are kangaroos from?",
            answers = {
                a = {txt = "Madagascar", truthValue = false},
                b = {txt = "Mainland African", truthValue = false},
                c = {txt = "New Zealanda", truthValue = false},
                d = {txt = "Australia", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "Did you know there are over 7 500 varieties of apples around the world?",
            questionTxt = "Which city is known as the \"Big Apple\"?",
            answers = {
                a = {txt = "Los Angeles", truthValue = false},
                b = {txt = "Chicago", truthValue = false},
                c = {txt = "Miami", truthValue = false},
                d = {txt = "New York", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "I love the poems Pablo Neruda wrote after visiting Machu Picchu.",
            questionTxt = "In which country can you visit the ancient ruins of Machu Picchu?",
            answers = {
                a = {txt = "Brazil", truthValue = false},
                b = {txt = "Argentina", truthValue = false},
                c = {txt = "Chile", truthValue = false},
                d = {txt = "Perú", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "I once visited a desert. I missed AC a lot.",
            questionTxt = "What is the world's largest desert?",
            answers = {
                a = {txt = "Gobi", truthValue = false},
                b = {txt = "Kalahari", truthValue = false},
                c = {txt = "Arabian", truthValue = false},
                d = {txt = "Sahara", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "How many famous landmarks have you visited? I've visited a lot!.",
            questionTxt = "Which famous landmark is located in Rome, Italy?",
            answers = {
                a = {txt = "Parthenon", truthValue = false},
                b = {txt = "Leaning Tower of Pisa", truthValue = false},
                c = {txt = "Eiffel Tower", truthValue = false},
                d = {txt = "Colosseum", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "I might love traveling, I've learned a lot of words in different languages!.",
            questionTxt = "What is the primary language spoken in Brazil?",
            answers = {
                a = {txt = "Spanish", truthValue = false},
                b = {txt = "French", truthValue = false},
                c = {txt = "English", truthValue = false},
                d = {txt = "Portuguese", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "Someone asked me to add maple syrup to their coffe once.",
            questionTxt = "What is the capital city of Canada?",
            answers = {
                a = {txt = "Toronto", truthValue = false},
                b = {txt = "Vancouver", truthValue = false},
                c = {txt = "Montreal", truthValue = false},
                d = {txt = "Ottawa", truthValue = true},
            },
            asked = false;
        },
    },
    normal = {
        {
            baristDialoge = "I come from a kinda normal sized town. But it is bigger than some countries.",
            questionTxt = "Which is the smallest country in the world?",
            answers = {
                a = {txt = "Monaco", truthValue = false},
                b = {txt = "Rome", truthValue = false},
                c = {txt = "Vatican City", truthValue = true},
                d = {txt = "Andorra", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "We don't sell them here, but French fries are amazing with burgers.",
            questionTxt = "Where are French fries from?",
            answers = {
                a = {txt = "Italy", truthValue = false},
                b = {txt = "France", truthValue = false},
                c = {txt = "Spain", truthValue = false},
                d = {txt = "Belgium", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "You learn some amazing things traveling. As an example, in 1937 there was an economic crisis because of the price of tulips",
            questionTxt = "Which European country is known for its canals and tulip fields?",
            answers = {
                a = {txt = "Belgium", truthValue = false},
                b = {txt = "Sweden", truthValue = false},
                c = {txt = "Switzerland", truthValue = false},
                d = {txt = "Neatherlands", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "I'd love to visit Alhambra someday",
            questionTxt = "In which city can you find the historic Alhambra palace?",
            answers = {
                a = {txt = "Madrid", truthValue = false},
                b = {txt = "Barcelona", truthValue = false},
                c = {txt = "Sevilla", truthValue = false},
                d = {txt = "Granada", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "I love archaeology so much. There are amazing buildings with amazing stories.",
            questionTxt = "Which country is home to the ancient city of Petra?",
            answers = {
                a = {txt = "Egypt", truthValue = false},
                b = {txt = "Lebanon", truthValue = false},
                c = {txt = "Saudi Arabia", truthValue = false},
                d = {txt = "Jordan", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "I'm not the best at climbing. But Madeline, a good friend of mine, is pretty good at it!.",
            questionTxt = "Which mountain is known as the \"Roof of Africa\"?",
            answers = {
                a = {txt = "Mount Elbrus", truthValue = false},
                b = {txt = "Mount Everest", truthValue = false},
                c = {txt = "Mount McKinley", truthValue = false},
                d = {txt = "Mount Kilimanjaro", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "A tasty dark coffe for you.",
            questionTxt = "Which country is the world's largest producer of coffee?",
            answers = {
                a = {txt = "Colombia", truthValue = false},
                b = {txt = "Vietnam", truthValue = false},
                c = {txt = "Ethiopia", truthValue = false},
                d = {txt = "Brazil", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "Don't you love how mystical some places feel like?",
            questionTxt = "In which country can you visit the historic site of Angkor Wat?",
            answers = {
                a = {txt = "Thailand", truthValue = false},
                b = {txt = "Vietnam", truthValue = false},
                c = {txt = "Laos", truthValue = false},
                d = {txt = "Cambodia", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "Empires and kingdoms. Once great, now, written pages, parents of countries, and sometimes, broken buildings.",
            questionTxt = "Which ancient city, now in ruins, was once the capital of the Nabataean kingdom?",
            answers = {
                a = {txt = "Babylon", truthValue = false},
                b = {txt = "Persepolis", truthValue = false},
                c = {txt = "Nineveh", truthValue = false},
                d = {txt = "Petra", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "As humans, we can get to pretty high places. Literally.",
            questionTxt = "What is the highest capital city in the world by altitude?",
            answers = {
                a = {txt = "Quito, Ecuador", truthValue = false},
                b = {txt = "Thimphu, Bhutan", truthValue = false},
                c = {txt = "Addis Ababa, Ethiopia", truthValue = false},
                d = {txt = "La Paz, Bolivia", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "Some people might not know this, but Mesoamerican empires could be as huge as European empires.",
            questionTxt = "Which country is home to the ancient Mayan city of Tikal?",
            answers = {
                a = {txt = "Mexico", truthValue = false},
                b = {txt = "Honduras", truthValue = false},
                c = {txt = "Belize", truthValue = false},
                d = {txt = "Guatemala", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "Vanilla, delicious for anything!",
            questionTxt = "Which country is the world's largest producer of vanilla?",
            answers = {
                a = {txt = "Papua New Guinea", truthValue = false},
                b = {txt = "Indonesia", truthValue = false},
                c = {txt = "Mexico", truthValue = false},
                d = {txt = "Madagascar", truthValue = true},
            },
            asked = false;
        },
    },

    hard = {
        {
            baristDialoge = "Did you know there was an European empire in South America?",
            questionTxt = "Which was the capital of the Empire of Brazil?",
            answers = {
                a = {txt = "Brasilia", truthValue = false},
                b = {txt = "São Paulo", truthValue = false},
                c = {txt = "Natal", truthValue = false},
                d = {txt = "Río de Janeiro", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "Something amazing about words is they change meaning with time.",
            questionTxt = "What did \"Barbarian\" mean for the Romans during the Roman Empire?",
            answers = {
                a = {txt = "Rude", truthValue = false},
                b = {txt = "Kind", truthValue = false},
                c = {txt = "Slave", truthValue = false},
                d = {txt = "Foreign", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "I love statues. They might have the most realistic or unrealistic expressions.",
            questionTxt = "Where are Moáis from?",
            answers = {
                a = {txt = "Thorney Island, currently an UK island.", truthValue = false},
                b = {txt = "Providencia Island, currently a Colombian island.", truthValue = false},
                c = {txt = "Hawaii, currently an USA island.", truthValue = false},
                d = {txt = "Rapa Nui, currently a Chilean island.", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "Sometimes we can't see the actual scale of countries.",
            questionTxt = "In which of the following countries would Europe fit?",
            answers = {
                a = {txt = "China", truthValue = false},
                b = {txt = "Australia", truthValue = false},
                c = {txt = "USA", truthValue = false},
                d = {txt = "Russia", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "UNESCO stands for United Nations Educational, Scientific and Cultural Organization, in case you wondered.",
            questionTxt = "Which country has the most UNESCO World Heritage Sites?",
            answers = {
                a = {txt = "China", truthValue = false},
                b = {txt = "Spain", truthValue = false},
                c = {txt = "France", truthValue = false},
                d = {txt = "Italy", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "Rivers, what a wonderful nature's gift.",
            questionTxt = "Which European capital city is divided by the River Danube?",
            answers = {
                a = {txt = "Vienna", truthValue = false},
                b = {txt = "Prague", truthValue = false},
                c = {txt = "Belgrade", truthValue = false},
                d = {txt = "Budapest", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "Islands are amazing. They're like thematic floating worlds.",
            questionTxt = "Which country has the most islands in the world?",
            answers = {
                a = {txt = "Indonesia", truthValue = false},
                b = {txt = "Philippines", truthValue = false},
                c = {txt = "Norway", truthValue = false},
                d = {txt = "Sweden", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "Countries, some big, some small.",
            questionTxt = "Which country is the smallest by land area in mainland Africa?",
            answers = {
                a = {txt = "Djibouti", truthValue = false},
                b = {txt = "Eswatini (Swaziland)", truthValue = false},
                c = {txt = "Lesotho", truthValue = false},
                d = {txt = "Gambia", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "Venice, what a lovely place.",
            questionTxt = "Which city is known as the \"Venice of the North\"?",
            answers = {
                a = {txt = "Bruges, Belgium", truthValue = false},
                b = {txt = "Stockholm, Sweden", truthValue = false},
                c = {txt = "Amsterdam, Netherlands", truthValue = false},
                d = {txt = "Saint Petersburg, Russia", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "Names change sometimes, even for countries.",
            questionTxt = "Which African country was formerly known as Abyssinia?",
            answers = {
                a = {txt = "Sudan", truthValue = false},
                b = {txt = "Eritrea", truthValue = false},
                c = {txt = "Somalia", truthValue = false},
                d = {txt = "Ethiopia", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "I once went to a café in the southernmost city in the world. Could you guess the name?",
            questionTxt = "What is the southernmost city in the world?",
            answers = {
                a = {txt = "Punta Arenas, Chile", truthValue = false},
                b = {txt = "Ushuaia, Argentina", truthValue = false},
                c = {txt = "Stanley, Falkland Islands / Malvinas", truthValue = false},
                d = {txt = "Puerto Williams, Chile", truthValue = true},
            },
            asked = false;
        },
    },
}

kpop = {
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
    },
    normal = {
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
    },

    hard = {
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
    },
}

catCoffe = {
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
    },
    normal = {
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
    },

    hard = {
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
    },
}