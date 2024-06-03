#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guessdb --no-align --tuples-only -c"

echo "Enter your username:"
read USERNAME

#get user id
USER_CHECK=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")

#if user id not exist
if [[ -z $USER_CHECK ]]
  then
    #insert new user
    REG_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
    #message for new user
    echo "Welcome, $USERNAME! It looks like this is your first time here."
  else
    #add query to this message
    GAME_PLAYED=$($PSQL "SELECT COUNT(*) FROM users INNER JOIN games USING(user_id) WHERE username='$USERNAME'")
    BEST_GAME=$($PSQL "SELECT MIN(number_guesses) FROM users INNER JOIN games USING(user_id) WHERE username='$USERNAME'")
    #message for user
    echo "Welcome back, $USERNAME! You have played $GAME_PLAYED games, and your best game took $BEST_GAME guesses."
fi

#generate random
RANUM=$(( 1 + $RANDOM % 1000))
#initiate guesses
GUESS=1
#question
echo "Guess the secret number between 1 and 1000:"

#game base logic
while read NUM
do
  #check if value is a number
  if [[ ! $NUM =~ ^[0-9]+$ ]]
    then
      echo -e "That is not an integer, guess again:"
    else
      #if number guess are correct
      if [[ $NUM -eq $RANUM ]]
      then
        break;
      else 
        #if number are greater than
        if [[ $NUM -gt $RANUM ]]
        then
          echo -e "It's lower than that, guess again:"
        else
          #if number are lower than
          if [[ $NUM -lt $RANUM ]]
          then
            echo -e "It's higher than that, guess again:"
          fi
        fi

      fi
  fi
  #guess increment per try
  GUESS=$(($GUESS + 1))
done

#message for victor
if [[ $GUESS == 1 ]]
then
  echo "You guessed it in $GUESS tries. The secret number was $RANUM. Nice job!"
else
  echo "You guessed it in $GUESS tries. The secret number was $RANUM. Nice job!"
fi


#record game into database
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
INSERT_GAME=$($PSQL "INSERT INTO games(number_guesses, user_id) VALUES($GUESS, $USER_ID)")


