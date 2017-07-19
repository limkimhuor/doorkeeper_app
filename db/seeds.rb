kimhuor = User.create! name: "kimhuor", password: "secret"
kimhuor.tasks.create! name: "paint the fence"
kimhuor.tasks.create! name: "wax the car"
kimhuor.tasks.create! name: "sand the deck"

leekim = User.create! name: "leekim", password: "secret"
leekim.tasks.create! name: "record some RailsCasts"
leekim.tasks.create! name: "work on CanCan"
