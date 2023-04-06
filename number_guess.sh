#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
# func for user handling

# Enter your username
GET_USER_TO_PLAY(){
# check for existing username and query stats
  # get username varchar30 from users
  # get games played int from users
  # get best game int from users
echo "Enter your username:"
read USERNAME
USER=$($PSQL "SELECT username, games_played, best_game FROM users WHERE username='$USERNAME'")
if [[ -z $USER ]]
then
# create new user if no existing record
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  NEW_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  
else
# print stats and user greetings
  echo $USER | while IFS="|" read USERNAME GAMES_PLAYED BEST_GAME
  do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi
  # all redirect to game function
  GUESSING_GAME
}

# func for game itself
GUESSING_GAME(){
# generate sekrit number
SECRET=$(($RANDOM % 1000 + 1))
# guess the secret number between 1 and 1000
echo "Guess the secret number between 1 and 1000:"
# loop exit
WINNER=false
TRIES=0

# that is not an integer, guess again
while [ $WINNER==false ]
do
  read GUESS
  if [[ ! $GUESS =~ ^[0-9]+ ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $GUESS -lt $SECRET ]]
  # it's higher than that, guess again
  then
    echo "It's higher than that, guess again:"
    ((TRIES+=1))
  elif [[ $GUESS -gt $SECRET ]]
  # it's lower than that, guess again
  then
    echo "It's lower than that, guess again:"
    ((TRIES+=1))
  else
  # you guessed it in x tries. the secret number was y. nice job!
  # also update stats
    ((TRIES+=1))
    UPDATE_STATS "$USERNAME" "$TRIES"
    echo "You guessed it in $TRIES tries. The secret number was $SECRET. Nice job!"
    break
  fi
done
}

UPDATE_STATS(){
  USER=$($PSQL "SELECT username, games_played, best_game FROM users WHERE username='$USERNAME'")
  echo $USER | while IFS="|" read USERNAME GAMES_PLAYED BEST_GAME
  do
    BEST_GAME=$(($TRIES < $BEST_GAME ? $BEST_GAME : $TRIES))
    GAMES_PLAYED=$((GAMES_PLAYED+=1))

    INSERT_STATS=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE username='$USERNAME'")
  done
}

GET_USER_TO_PLAY