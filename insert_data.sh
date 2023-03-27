#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

($PSQL "TRUNCATE games, teams;")

# year,round,winner,opponent,winner_goals,opponent_goals

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNERGOALS OPPONENTGOALS
do
  WINN_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  OPPO_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  # WINNER_ID=$($PSQL "SELECT winner_id FROM games LEFT JOIN teams ON games.winner_id = teams.team_id WHERE teams.name='$WINNER'")
  # OPPONENT_ID=$($PSQL "SELECT opponent_id FROM games LEFT JOIN teams ON games.opponent_id = teams.team_id WHERE teams.name='$OPPONENT'")

  if [[ $WINNER != 'winner' || $OPPONENT != 'opponent' ]]
    then
      if [[ -z $WINN_ID && $OPPO_ID!=null ]]
        then
          INSERT_WINNER=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
          WINN_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
      fi
      # 
      if [[ -z $OPPO_ID || $WINN_ID!=null ]]
        then
          INSERT_OPPONENT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
          OPPO_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
      fi
      
      # Cursed solution spits out unique errors, not production grade, needs team insertion conditionals to be fixed
      INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINN_ID, $OPPO_ID, $WINNERGOALS, $OPPONENTGOALS)")
    fi
done