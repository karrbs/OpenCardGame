Card Game Builder

Search Card Game

Card Game Manager (admin)

- Open Card game 
    - users
      - tag
      - profile pic
      - username
      - timezone
      - birthday
      - collection_id
    - game
      - id
      - name
      - settings_id
      - created_date
      - modified_date
    - game settings
      - id
      - is_public
      - per_player_slots
      - back_graphic
      - is_nsfw
      - collectors
    - Cards
      - id
      - front_graphic
      - name
      - stats
      - effects
      - type_id
    - Card type
      - id
      - type
        - character
        - effect
          - spells
          - items
          - trap
        - elements
        - attack
    - Card Effect
      - what
      - howlong
    - attack cards
      - attacks 
      - resit 
      - required card
      - required count 
    - user_collection
      - 
      - game_id
      - card_id

## Structures
### File Storage
```
Games
└── [game_id]
    ├── cards
    ├── audio
    └── general
User
└── [user_id]
    └── profile
Default
├── User
│   └── profile
└── Game
    ├── cards
    ├── audio
    └── general
```

## Pages
- Splash
- Login
- SignUp 
- Profile
- Browse Games
- Create Game
- Edit Game
- Add Card
- Play Game


Game Rule
- place card rule 
    - number of cards per turn
      - EX: 3 per turn
        - 1 element
        - 1 attack
        - 1 trap
    - acumilate per turn
    - element cards ?