--!Type(Module)

--[[
            This module script will not have any logic on it. Instead, it will be treated
            as a JSON, containing categories, difficulty, questions, answers and wheter if it is or
            is not correct.

            Note: as the scope of the game changed, everything will be on "travel". This will change
            if more categories are added sometime in the future.
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
            -- travel --
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

        -- animals
        {
            baristDialoge = "Kings and queens. Is it only a human thing?",
            questionTxt = "Which animal is known as the \"King of the Jungle\"?",
            answers = {
                a = {txt = "Elephant", truthValue = false},
                b = {txt = "Tiger", truthValue = false},
                c = {txt = "Gorilla", truthValue = false},
                d = {txt = "Lion", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "When I was a young boy my father told me hedgehogs were as fast as light. It wasn't true.",
            questionTxt = "from the following animals, which is the fastest?",
            answers = {
                a = {txt = "Gazelle", truthValue = false},
                b = {txt = "Horse", truthValue = false},
                c = {txt = "Lion", truthValue = false},
                d = {txt = "Cheeta", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "Zecora is my favourite MLP: FIM character.",
            questionTxt = "Which animal is famous for its black and white stripes?",
            answers = {
                a = {txt = "Tiger", truthValue = false},
                b = {txt = "Panda", truthValue = false},
                c = {txt = "Cat", truthValue = false},
                d = {txt = "Zebra", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "Have you watched The Owl House? I liked it a lot!",
            questionTxt = "Which bird is known for its colorful plumage and ability to mimic sounds?",
            answers = {
                a = {txt = "Crow", truthValue = false},
                b = {txt = "Eagle", truthValue = false},
                c = {txt = "Owl", truthValue = false},
                d = {txt = "Parrot", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "I have a friend who loves frogs. She's obsessed with how cute they are.",
            questionTxt = "What type of animal is a frog?",
            answers = {
                a = {txt = "Mammal", truthValue = false},
                b = {txt = "Bird", truthValue = false},
                c = {txt = "Reptile", truthValue = false},
                d = {txt = "Amphibian", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "I remember once there was a sea creature who could predict the result of soccer games.",
            questionTxt = "Which sea creature has eight extremities?",
            answers = {
                a = {txt = "Jellyfish", truthValue = false},
                b = {txt = "Starfish", truthValue = false},
                c = {txt = "Shark", truthValue = false},
                d = {txt = "Octopus", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "I have a friend in Colombia who tried to play dead to avoid getting robbed. It didn't work.",
            questionTxt = "Which animal is known for playing dead as a defense mechanism?",
            answers = {
                a = {txt = "Chameleon", truthValue = false},
                b = {txt = "Armadillo", truthValue = false},
                c = {txt = "Skunk", truthValue = false},
                d = {txt = "Opossum", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "Mammals are usually fluffy. My parthner loves fluffy creatures. A lot. It scares me sometimes because spiders are fluffy too.",
            questionTxt = "Which animal is the largest mammal in the world?",
            answers = {
                a = {txt = "Elephant", truthValue = false},
                b = {txt = "Giraffe", truthValue = false},
                c = {txt = "Hippopotamus", truthValue = false},
                d = {txt = "Blue Whale", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "I still cry every time at that scene from The Lion King.",
            questionTxt = "What is a group of lions called?",
            answers = {
                a = {txt = "Pack", truthValue = false},
                b = {txt = "Herd", truthValue = false},
                c = {txt = "Flock", truthValue = false},
                d = {txt = "Pride", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "If I add more RGB to my pet will it run faster?",
            questionTxt = "Which animal is known for its ability to change color?",
            answers = {
                a = {txt = "Iguana", truthValue = false},
                b = {txt = "Squid", truthValue = false},
                c = {txt = "Frog", truthValue = false},
                d = {txt = "Chameleon", truthValue = true},
            },
            asked = false;
        },

        -- videogames --
        {
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
        {
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
        {
            baristDialoge = "My father told me his first videogame was ET. Second one was Super Mario Bross!",
            questionTxt = "What is the name of the main character in the Super Mario series?",
            answers = {
                a = {txt = "Luigi", truthValue = false},
                b = {txt = "Mario", truthValue = true},
                c = {txt = "Peach", truthValue = false},
                d = {txt = "Bowser", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Currently, there are over a thousand of different poket monsters!",
            questionTxt = "Which Pokémon is known as the mascot of the Pokémon franchise?",
            answers = {
                a = {txt = "Charmander", truthValue = false},
                b = {txt = "Bulbasaur", truthValue = false},
                c = {txt = "Squirtle", truthValue = false},
                d = {txt = "Pikachu", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "Gotta go fast!",
            questionTxt = "What is the name of the blue hedgehog who is the main character of a popular Sega game series?",
            answers = {
                a = {txt = "Tails", truthValue = false},
                b = {txt = "Knuckles", truthValue = false},
                c = {txt = "Sonic", truthValue = true},
                d = {txt = "Shadow", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Even if some companies are obsessed with graphics, most selled videogame is pixelated.",
            questionTxt = "In which game do players build and explore in a blocky, 3D, pixelated world?",
            answers = {
                a = {txt = "Roblox", truthValue = false},
                b = {txt = "Terraria", truthValue = false},
                c = {txt = "Minecraft", truthValue = true},
                d = {txt = "Fortnite", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "What do you mean Zelda is not the protagonist?",
            questionTxt = "What is the name of the princess whom Link often rescues in The Legend of Zelda series?",
            answers = {
                a = {txt = "Zelda", truthValue = true},
                b = {txt = "Epona", truthValue = false},
                c = {txt = "Midna", truthValue = false},
                d = {txt = "Impa", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "It was a pizza! I swear!",
            questionTxt = "Which classic video game involves a yellow character eating dots in a maze while avoiding ghosts?",
            answers = {
                a = {txt = "Pac-Man", truthValue = true},
                b = {txt = "Donkey Kong", truthValue = false},
                c = {txt = "Galaga", truthValue = false},
                d = {txt = "Space Invaders", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "My parthner always beats me up in fighting games. But every time I win, victory is so sweet!",
            questionTxt = "Which video game series features characters like Ryu, Ken, and Chun-Li?",
            answers = {
                a = {txt = "Tekken", truthValue = false},
                b = {txt = "Mortal Kombat", truthValue = false},
                c = {txt = "Street Fighter", truthValue = true},
                d = {txt = "Soulcalibur", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "You can learn history with videogames!",
            questionTxt = "Which video game series features a group of assassins fighting against the Templars throughout history?",
            answers = {
                a = {txt = "Hitman", truthValue = false},
                b = {txt = "Dishonored", truthValue = false},
                c = {txt = "Thief", truthValue = false},
                d = {txt = "Assassin's Creed", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "Tenis for two is considered to be the first videogame ever. But it wasn't commercial.",
            questionTxt = "What is considered the first commercially successful video game?",
            answers = {
                a = {txt = "Space Invaders", truthValue = false},
                b = {txt = "Pong", truthValue = true},
                c = {txt = "Asteroids", truthValue = false},
                d = {txt = "Tetris", truthValue = false},
            },
            asked = false;
        },

        -- music --
        {
            baristDialoge = "Prince was a multi-talented musician and performer.",
            questionTxt = "Which Prince album features the song 'Purple Rain'?",
            answers = {
                a = {txt = "1999", truthValue = false},
                b = {txt = "Purple Rain", truthValue = true},
                c = {txt = "Sign o' the Times", truthValue = false},
                d = {txt = "Parade", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Why is people still obsessed with kings and queens?",
            questionTxt = "Which artist is known as the 'King of Pop'?",
            answers = {
                a = {txt = "Prince", truthValue = false},
                b = {txt = "Michael Jackson", truthValue = true},
                c = {txt = "Elton John", truthValue = false},
                d = {txt = "Stevie Wonder", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "What do you mean Queen isn't considered as the queen of rock?",
            questionTxt = "Which artist is known as the 'Queen of Pop'?",
            answers = {
                a = {txt = "Whitney Houston", truthValue = false},
                b = {txt = "Celine Dion", truthValue = false},
                c = {txt = "Madonna", truthValue = true},
                d = {txt = "Mariah Carey", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "I can get no! Dududu~",
            questionTxt = "Which band sang 'Satisfaction' and 'Paint It Black'?",
            answers = {
                a = {txt = "The Who", truthValue = false},
                b = {txt = "The Beatles", truthValue = false},
                c = {txt = "The Rolling Stones", truthValue = true},
                d = {txt = "Led Zeppelin", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Once a musician said that albums are like contemporany symphonies.",
            questionTxt = "Which artist released the albums 'Fearless' and '1989'?",
            answers = {
                a = {txt = "Katy Perry", truthValue = false},
                b = {txt = "Adele", truthValue = false},
                c = {txt = "Taylor Swift", truthValue = true},
                d = {txt = "Lady Gaga", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Naaaaa naaaa na narananaaaaaaaaa narananaaaaaaaaa Hey Jude.",
            questionTxt = "Which band released the song 'Hey Jude'?",
            answers = {
                a = {txt = "The Beach Boys", truthValue = false},
                b = {txt = "The Beatles", truthValue = true},
                c = {txt = "The Kinks", truthValue = false},
                d = {txt = "The Monkees", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "K-pop is a huge thing these years!",
            questionTxt = "Which K-pop group is known for the hit songs 'Dynamite' and 'Butter'?",
            answers = {
                a = {txt = "EXO", truthValue = false},
                b = {txt = "BLACKPINK", truthValue = false},
                c = {txt = "BTS", truthValue = true},
                d = {txt = "TWICE", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "K-pop groups are similar to 'boybands'. And the femenine equivalent.",
            questionTxt = "Which K-pop girl group released the song 'How You Like That'?",
            answers = {
                a = {txt = "Red Velvet", truthValue = false},
                b = {txt = "BLACKPINK", truthValue = true},
                c = {txt = "GFriend", truthValue = false},
                d = {txt = "ITZY", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "'Gangnam style' is a way to refear a lifestyle few people can afford. It takes it's name from Gangam region of Seul.",
            questionTxt = "Which K-pop artist is famous for the song 'Gangnam Style'?",
            answers = {
                a = {txt = "Rain", truthValue = false},
                b = {txt = "Taeyang", truthValue = false},
                c = {txt = "Psy", truthValue = true},
                d = {txt = "J-Hope", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "A friend thinks that K-pop is even more pop than pop itself. I find her opinion confusing.",
            questionTxt = "Which K-pop group has members named Baekhyun, Chanyeol, and Kai?",
            answers = {
                a = {txt = "SEVENTEEN", truthValue = false},
                b = {txt = "NCT", truthValue = false},
                c = {txt = "EXO", truthValue = true},
                d = {txt = "GOT7", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Something I love from K-pop are their musical videos. Singers also have amazing dance moves!",
            questionTxt = "Which K-pop girl group released the song 'Fancy'?",
            answers = {
                a = {txt = "MAMAMOO", truthValue = false},
                b = {txt = "TWICE", truthValue = true},
                c = {txt = "Girls' Generation", truthValue = false},
                d = {txt = "LOONA", truthValue = false},
            },
            asked = false;
        },        
    },
    normal = {
        -- travel --
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

        -- animals --
        {
            baristDialoge = "I still dream about having my own functional wings.",
            questionTxt = "What is the only mammal capable of true flight?",
            answers = {
                a = {txt = "Colugo", truthValue = false},
                b = {txt = "Sugar glider", truthValue = false},
                c = {txt = "Flying squirrel", truthValue = false},
                d = {txt = "Bat", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "I still dream about having my own functional wings.",
            questionTxt = "Which animal has the largest brain in proportion to its body size?",
            answers = {
                a = {txt = "Ant", truthValue = false},
                b = {txt = "Elephant", truthValue = false},
                c = {txt = "Human", truthValue = false},
                d = {txt = "Dolphin", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "If I speak several languages, do I have a long tongue?",
            questionTxt = "Which animal is known for having a tongue that can be as long as its body?",
            answers = {
                a = {txt = "Frog", truthValue = false},
                b = {txt = "Giraffe", truthValue = false},
                c = {txt = "Anteater", truthValue = false},
                d = {txt = "Chameleon", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "I love ponies and penguins. Both so small and cute.",
            questionTxt = "What is the largest species of penguin?",
            answers = {
                a = {txt = "King Penguin", truthValue = false},
                b = {txt = "Gentoo Penguin", truthValue = false},
                c = {txt = "Adelie Penguin", truthValue = false},
                d = {txt = "Emperor Penguin", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "Nine months are a lot, but some animals wait about 22 months for their births.",
            questionTxt = "Which animal has the longest gestation period?",
            answers = {
                a = {txt = "Rhinoceros", truthValue = false},
                b = {txt = "Giraffe", truthValue = false},
                c = {txt = "Blue whale", truthValue = false},
                d = {txt = "African Elephant", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "Dragons are so cool!",
            questionTxt = "What type of animal is a Komodo dragon?",
            answers = {
                a = {txt = "Snake", truthValue = false},
                b = {txt = "Crocodile", truthValue = false},
                c = {txt = "Turtle", truthValue = false},
                d = {txt = "Lizard", truthValue = true},
            },
            asked = false;
        },
        {
        baristDialoge = "Before animal rights were a thing, some instruments were made with endangered animal parts.",
        questionTxt = "What is the main component of an elephant's tusks?",
        answers = {
            a = {txt = "Bone", truthValue = false},
            b = {txt = "Keratin", truthValue = false},
            c = {txt = "Ivory", truthValue = true},
            d = {txt = "Calcium", truthValue = false},
            },
        asked = false;
        },

        -- videogames --
        {
            baristDialoge = "Mama mia!",
            questionTxt = "In which game did Mario first appear?",
            answers = {
                a = {txt = "Super Mario Bros.", truthValue = false},
                b = {txt = "Donkey Kong", truthValue = true},
                c = {txt = "Mario Bros.", truthValue = false},
                d = {txt = "The Legend of Zelda", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "How many shooters have you played? I've played the amazing quantity of 3.",
            questionTxt = "What is the name of the protagonist in the Halo series?",
            answers = {
                a = {txt = "Commander Shepard", truthValue = false},
                b = {txt = "Marcus Fenix", truthValue = false},
                c = {txt = "Master Chief", truthValue = true},
                d = {txt = "Gordon Freeman", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Which is the best FF? That's how you get FF fans to start a fight.",
            questionTxt = "Which Final Fantasy game features the character Cloud Strife?",
            answers = {
                a = {txt = "Final Fantasy VI", truthValue = false},
                b = {txt = "Final Fantasy VII", truthValue = true},
                c = {txt = "Final Fantasy VIII", truthValue = false},
                d = {txt = "Final Fantasy IX", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "People say Majora's Mask is scarier, but Ocarina of Time has some existentional drama as well.",
            questionTxt = "In The Legend of Zelda: Ocarina of Time, what is the name of Link's fairy companion?",
            answers = {
                a = {txt = "Navi", truthValue = true},
                b = {txt = "Tatl", truthValue = false},
                c = {txt = "Midna", truthValue = false},
                d = {txt = "Fi", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Elder Scrolls V: Skyrim is set in a vast open world.",
            questionTxt = "Which race in The Elder Scrolls V: Skyrim is known for their stealth abilities and night vision?",
            answers = {
                a = {txt = "Nord", truthValue = false},
                b = {txt = "Khajiit", truthValue = true},
                c = {txt = "Argonian", truthValue = false},
                d = {txt = "Dunmer (Dark Elf)", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Portal features mind-bending puzzles.",
            questionTxt = "What is the name of the AI antagonist in Portal?",
            answers = {
                a = {txt = "HAL 9000", truthValue = false},
                b = {txt = "Cortana", truthValue = false},
                c = {txt = "GLaDOS", truthValue = true},
                d = {txt = "SHODAN", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Mega Man has an iconic blue suit.",
            questionTxt = "What is the name of Mega Man's robotic dog companion?",
            answers = {
                a = {txt = "Rush", truthValue = true},
                b = {txt = "Roll", truthValue = false},
                c = {txt = "Proto", truthValue = false},
                d = {txt = "Beat", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Street Fighter has a rich variety of characters.",
            questionTxt = "Which character in Street Fighter is known for their green skin and electric attacks?",
            answers = {
                a = {txt = "Ryu", truthValue = false},
                b = {txt = "Chun-Li", truthValue = false},
                c = {txt = "Blanka", truthValue = true},
                d = {txt = "Guile", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "The Witcher 3 features a lot of details in its world!",
            questionTxt = "In The Witcher series, what is the name of Geralt's horse?",
            answers = {
                a = {txt = "Roach", truthValue = true},
                b = {txt = "Shadowfax", truthValue = false},
                c = {txt = "Epona", truthValue = false},
                d = {txt = "Agro", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Overwatch's so fun! I love the hamster!",
            questionTxt = "Which Overwatch character says 'It's high noon'?",
            answers = {
                a = {txt = "Tracer", truthValue = false},
                b = {txt = "Reaper", truthValue = false},
                c = {txt = "McCree", truthValue = true},
                d = {txt = "Hanzo", truthValue = false},
            },
            asked = false;
        },
        
        -- music --
        {
            questionTxt = "Could you tell me how do you find a C note in a piano?",
            baristDialoge = "I took leasons once, but i forgot...",
            answers = {
                a = {txt = "The first white key of any piano.", truthValue = false},
                b = {txt = "The white key before a group of two black keys.", truthValue = true},
                c = {txt = "The first black key of every piano.", truthValue = false},
                d = {txt = "The white key before a group of three black keys.", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "If I spent my whole life painting, maybe I could still do it even after getting blind.",
            questionTxt = "Which famous composer became deaf later in his life but continued to compose music?",
            answers = {
                a = {txt = "Wolfgang Amadeus Mozart", truthValue = false},
                b = {txt = "Johann Sebastian Bach", truthValue = false},
                c = {txt = "Ludwig van Beethoven", truthValue = true},
                d = {txt = "Franz Schubert", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "The British Invasion must have been something for the USA. It was a huge influence for new musicians!",
            questionTxt = "Which band is known as the 'Fab Four' and hailed from Liverpool, England?",
            answers = {
                a = {txt = "The Rolling Stones", truthValue = false},
                b = {txt = "The Beatles", truthValue = true},
                c = {txt = "The Who", truthValue = false},
                d = {txt = "Queen", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Some people say Jazz is as complex as Classical. I think every gender can be simple or complex.",
            questionTxt = "Which jazz musician is known for his influential album 'Kind of Blue'?",
            answers = {
                a = {txt = "John Coltrane", truthValue = false},
                b = {txt = "Charlie Parker", truthValue = false},
                c = {txt = "Miles Davis", truthValue = true},
                d = {txt = "Louis Armstrong", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "King of Rock, king of Pop, king of Metal... King of Candies? I love candies!",
            questionTxt = "Which artist is known as the 'King of Rock and Roll'?",
            answers = {
                a = {txt = "Elvis Presley", truthValue = true},
                b = {txt = "Chuck Berry", truthValue = false},
                c = {txt = "Little Richard", truthValue = false},
                d = {txt = "Buddy Holly", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Writing the lyrics for a song is writting a poem with a melody.",
            questionTxt = "Which American singer-songwriter won the Nobel Prize in Literature in 2016?",
            answers = {
                a = {txt = "Bruce Springsteen", truthValue = false},
                b = {txt = "Leonard Cohen", truthValue = false},
                c = {txt = "Paul Simon", truthValue = false},
                d = {txt = "Bob Dylan", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "There are legendary K-pop groups!",
            questionTxt = "Which K-pop group is known for the songs 'Fantastic Baby' and 'Bang Bang Bang'?",
            answers = {
                a = {txt = "SHINee", truthValue = false},
                b = {txt = "Super Junior", truthValue = false},
                c = {txt = "Big Bang", truthValue = true},
                d = {txt = "2PM", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Some singers also start their own solo career!",
            questionTxt = "Which member of Big Bang is also known for his successful solo career and fashion influence?",
            answers = {
                a = {txt = "Taeyang", truthValue = false},
                b = {txt = "Seungri", truthValue = false},
                c = {txt = "G-Dragon", truthValue = true},
                d = {txt = "T.O.P", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Even if it is called 'K-pop', some groups are multinational!",
            questionTxt = "How many members are there in the girl group TWICE?",
            answers = {
                a = {txt = "7", truthValue = false},
                b = {txt = "8", truthValue = false},
                c = {txt = "9", truthValue = true},
                d = {txt = "10", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Some musical groups get so huge they start dividing by units.",
            questionTxt = "Which K-pop boy group is known for having 13 members and being divided into three units: hip-hop, vocal, and performance?",
            answers = {
                a = {txt = "NCT", truthValue = false},
                b = {txt = "SEVENTEEN", truthValue = true},
                c = {txt = "EXO", truthValue = false},
                d = {txt = "GOT7", truthValue = false},
            },
            asked = false;
        },
    },

    hard = {
        -- travel --
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

        -- animals --
        {
            baristDialoge = "Perry!",
            questionTxt = "Which mammal lays eggs?",
            answers = {
                a = {txt = "Echidna", truthValue = true},
                b = {txt = "Platypus", truthValue = true},
                c = {txt = "Both, Echidna and Platypus.", truthValue = true},
                d = {txt = "No mammal lays eggs.", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Axolotls are fascinating amphibians. They're so cute!",
            questionTxt = "What type of animal is an axolotl?",
            answers = {
                a = {txt = "Fish", truthValue = false},
                b = {txt = "Reptile", truthValue = false},
                c = {txt = "Amphibian", truthValue = true},
                d = {txt = "Mammal", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Dolphins are so cute but I SWEAR they're evil!",
            questionTxt = "What is the largest species of dolphin?",
            answers = {
                a = {txt = "Bottlenose dolphin", truthValue = false},
                b = {txt = "Orca", truthValue = true},
                c = {txt = "Spinner dolphin", truthValue = false},
                d = {txt = "Risso's dolphin", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Narwhals are often called the unicorns of the sea.",
            questionTxt = "What is the primary function of a narwhal's tusk?",
            answers = {
                a = {txt = "Offensive organ", truthValue = false},
                b = {txt = "Defensive organ", truthValue = false},
                c = {txt = "Sensory organ", truthValue = true},
                d = {txt = "Mating display", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Our lives are so short! Some animals live centuries!",
            questionTxt = "Which animal is known to have the longest lifespan?",
            answers = {
                a = {txt = "Bowhead whale", truthValue = false},
                b = {txt = "Elephant", truthValue = false},
                c = {txt = "Greenland shark", truthValue = true},
                d = {txt = "Galapagos tortoise", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "I once tried to practice bow and arrow sport. My aim was awful!",
            questionTxt = "Which fish is known for its ability to shoot water to knock down prey?",
            answers = {
                a = {txt = "Archerfish", truthValue = true},
                b = {txt = "Pufferfish", truthValue = false},
                c = {txt = "Lionfish", truthValue = false},
                d = {txt = "Electric eel", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Australia once had a war against Emus. Emus won.",
            questionTxt = "What is the world's most dangerous bird?",
            answers = {
                a = {txt = "Ostrich", truthValue = false},
                b = {txt = "Cassowary", truthValue = true},
                c = {txt = "Eagle", truthValue = false},
                d = {txt = "Emu", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Empires had rised and fallen, and it was still young.",
            questionTxt = "What animal is known for its apparent immortality?",
            answers = {
                a = {txt = "Turritopsis dohrnii", truthValue = true},
                b = {txt = "Natator depressus", truthValue = false},
                c = {txt = "Scyllarides latus", truthValue = false},
                d = {txt = "Enteroctopus dofleini", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "When I was in school, a friend wanted to lift the heaviest animal in the world. She was strong but I doubt she could do it.",
            questionTxt = "What is the heaviest animal in the world?",
            answers = {
                a = {txt = "African elephant", truthValue = false},
                b = {txt = "Blue whale", truthValue = true},
                c = {txt = "Great white shark", truthValue = false},
                d = {txt = "Giraffe", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Intelligence is everywhere!",
            questionTxt = "Which cephalopod is known for its ability to solve puzzles and escape enclosures?",
            answers = {
                a = {txt = "Squid", truthValue = false},
                b = {txt = "Octopus", truthValue = true},
                c = {txt = "Cuttlefish", truthValue = false},
                d = {txt = "Nautilus", truthValue = false},
            },
            asked = false;
        },

        -- videogames --
        {
            baristDialoge = "The legend says Final Fantasy was the studio's final fantasy before closing for bankruptcy. But it was a surprising success!",
            questionTxt = "What year was the first Final Fantasy game released?",
            answers = {
                a = {txt = "1985", truthValue = false},
                b = {txt = "1987", truthValue = true},
                c = {txt = "1990", truthValue = false},
                d = {txt = "1992", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Dark Souls is the Dark Souls of Dark Souls saga.",
            questionTxt = "Who is the director of the Dark Souls series?",
            answers = {
                a = {txt = "Hideo Kojima", truthValue = false},
                b = {txt = "Shigeru Miyamoto", truthValue = false},
                c = {txt = "Hidetaka Miyazaki", truthValue = true},
                d = {txt = "Tetsuya Nomura", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "The Metal Gear series has an amazing narrative! It's almost as watching a movie!",
            questionTxt = "What is the real name of the character Solid Snake in the Metal Gear series?",
            answers = {
                a = {txt = "John", truthValue = false},
                b = {txt = "David", truthValue = true},
                c = {txt = "Jack", truthValue = false},
                d = {txt = "Eli", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Even if there were narrative elements in older shooters, Half-Life brought it to mainstream.",
            questionTxt = "Which is the name of the empire which conquered Earth in Half-Life 2?",
            answers = {
                a = {txt = "Vortigaunts", truthValue = false},
                b = {txt = "Combine", truthValue = true},
                c = {txt = "Headcrabs", truthValue = false},
                d = {txt = "Antlions", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "If you got short with The Witcher 3 main game, you can play it's expansions!",
            questionTxt = "What is the title of the first expansion for The Witcher 3: Wild Hunt?",
            answers = {
                a = {txt = "Hearts of Stone", truthValue = true},
                b = {txt = "Blood and Wine", truthValue = false},
                c = {txt = "Wild Hunt", truthValue = false},
                d = {txt = "Nightfall", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "BioShock explores themes of free will and utopia.",
            questionTxt = "Who is the founder of the underwater city of Rapture in BioShock?",
            answers = {
                a = {txt = "Andrew Ryan", truthValue = true},
                b = {txt = "Frank Fontaine", truthValue = false},
                c = {txt = "Atlas", truthValue = false},
                d = {txt = "Sander Cohen", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "I saw a deeer today. It was lovely.",
            questionTxt = "In Portal 2, who provides the voice for the character Wheatley?",
            answers = {
                a = {txt = "Stephen Merchant", truthValue = true},
                b = {txt = "J.K. Simmons", truthValue = false},
                c = {txt = "Ellen McLain", truthValue = false},
                d = {txt = "Jonathan Coulton", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "The Mass Effect series spans galaxies.",
            questionTxt = "What is the name of the ship commanded by Commander Shepard in the Mass Effect series?",
            answers = {
                a = {txt = "Normandy", truthValue = true},
                b = {txt = "Endeavor", truthValue = false},
                c = {txt = "Serenity", truthValue = false},
                d = {txt = "Enterprise", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "I'll let the music speak for me, my soul and everything will be okay.",
            questionTxt = "Which Overwatch hero is a DJ who can heal teammates with music?",
            answers = {
                a = {txt = "Lucio", truthValue = true},
                b = {txt = "Mercy", truthValue = false},
                c = {txt = "Zenyatta", truthValue = false},
                d = {txt = "Moira", truthValue = false},
            },
            asked = false;
        },
        
        -- music --
        {
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
        {
            baristDialoge = "So many years since, and the lyrics still hits hard...",
            questionTxt = "Which Pink Floyd album features the song 'Money'?",
            answers = {
                a = {txt = "The Wall", truthValue = false},
                b = {txt = "Wish You Were Here", truthValue = false},
                c = {txt = "The Dark Side of the Moon", truthValue = true},
                d = {txt = "Animals", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Bob Dylan's influence on music is profound.",
            questionTxt = "Which Bob Dylan album is known for the song 'Like a Rolling Stone'?",
            answers = {
                a = {txt = "The Freewheelin' Bob Dylan", truthValue = false},
                b = {txt = "Bringing It All Back Home", truthValue = false},
                c = {txt = "Highway 61 Revisited", truthValue = true},
                d = {txt = "Blonde on Blonde", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Jimi Hendrix is one of the greatest guitarists of all time.",
            questionTxt = "Which Jimi Hendrix album features the track 'All Along the Watchtower'?",
            answers = {
                a = {txt = "Are You Experienced", truthValue = false},
                b = {txt = "Axis: Bold as Love", truthValue = false},
                c = {txt = "Electric Ladyland", truthValue = true},
                d = {txt = "Band of Gypsys", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Sergeant Pepper's is often cited as the greatest albums of all time. I mean it is pretty good but is it THAt good?",
            questionTxt = "Which year was The Beatles' 'Sgt. Pepper's Lonely Hearts Club Band' released?",
            answers = {
                a = {txt = "1965", truthValue = false},
                b = {txt = "1967", truthValue = true},
                c = {txt = "1968", truthValue = false},
                d = {txt = "1969", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Some guitar stores have a strict 'no Starway to Heaven' rule. I wonder why.",
            questionTxt = "Which Led Zeppelin album features 'Stairway to Heaven'?",
            answers = {
                a = {txt = "Led Zeppelin II", truthValue = false},
                b = {txt = "Led Zeppelin III", truthValue = false},
                c = {txt = "Led Zeppelin IV", truthValue = true},
                d = {txt = "Houses of the Holy", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "David Bowie was a musical chameleon.",
            questionTxt = "Which David Bowie album features the character Ziggy Stardust?",
            answers = {
                a = {txt = "Hunky Dory", truthValue = false},
                b = {txt = "Diamond Dogs", truthValue = false},
                c = {txt = "The Rise and Fall of Ziggy Stardust and the Spiders from Mars", truthValue = true},
                d = {txt = "Aladdin Sane", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "The Rolling Stones have a vast catalog of hits.",
            questionTxt = "Which Rolling Stones album features the song 'Gimme Shelter'?",
            answers = {
                a = {txt = "Let It Bleed", truthValue = true},
                b = {txt = "Sticky Fingers", truthValue = false},
                c = {txt = "Beggars Banquet", truthValue = false},
                d = {txt = "Exile on Main St.", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Queen's Bohemian Rhapsody is an iconic song.",
            questionTxt = "Who is the lead guitarist of Queen, known for his virtuosic playing and signature sound?",
            answers = {
                a = {txt = "Brian May", truthValue = true},
                b = {txt = "Jimmy Page", truthValue = false},
                c = {txt = "Eric Clapton", truthValue = false},
                d = {txt = "Keith Richards", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "Nirvana brought grunge music to the mainstream.",
            questionTxt = "Which Nirvana album features the song 'Smells Like Teen Spirit'?",
            answers = {
                a = {txt = "Bleach", truthValue = false},
                b = {txt = "Nevermind", truthValue = true},
                c = {txt = "In Utero", truthValue = false},
                d = {txt = "MTV Unplugged in New York", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "BTS members have unique stage names.",
            questionTxt = "What is the real name of BTS's RM?",
            answers = {
                a = {txt = "Kim Seok-jin", truthValue = false},
                b = {txt = "Min Yoon-gi", truthValue = false},
                c = {txt = "Jung Ho-seok", truthValue = false},
                d = {txt = "Kim Nam-joon", truthValue = true},
            },
            asked = false;
        },
        {
            baristDialoge = "EXO has had members from different countries.",
            questionTxt = "Which EXO member is known for his acting career and was born in Canada?",
            answers = {
                a = {txt = "Lay", truthValue = false},
                b = {txt = "Chanyeol", truthValue = false},
                c = {txt = "Kris", truthValue = true},
                d = {txt = "Suho", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "TWICE's international appeal is vast.",
            questionTxt = "Which member of TWICE is Japanese and known for her dancing skills?",
            answers = {
                a = {txt = "Jihyo", truthValue = false},
                b = {txt = "Sana", truthValue = true},
                c = {txt = "Tzuyu", truthValue = false},
                d = {txt = "Nayeon", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "NCT is known for its large number of members.",
            questionTxt = "Which sub-unit of NCT released the song 'Kick It'?",
            answers = {
                a = {txt = "NCT U", truthValue = false},
                b = {txt = "NCT 127", truthValue = true},
                c = {txt = "NCT Dream", truthValue = false},
                d = {txt = "WayV", truthValue = false},
            },
            asked = false;
        },
        {
            baristDialoge = "G-Dragon is a prominent solo artist.",
            questionTxt = "Which solo album by G-Dragon includes the hit song 'Crooked'?",
            answers = {
                a = {txt = "Heartbreaker", truthValue = false},
                b = {txt = "Coup d'Etat", truthValue = true},
                c = {txt = "Kwon Ji Yong", truthValue = false},
                d = {txt = "One of a Kind", truthValue = false},
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