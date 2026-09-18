#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  [[ "$YEAR" =~ ^[0-9]+$ ]] || continue
  # echo "$YEAR $ROUND $WINNER $OPPONENT $WINNER_GOALS $OPPONENT_GOALS"
  WINNER_INSERT_RESULT=$($PSQL "INSERT INTO teams(name)
        SELECT '$WINNER'
        WHERE NOT EXISTS(
          SELECT 1 FROM teams WHERE name='$WINNER'
        )")
  OPPONENT_INSERT_RESULT=$($PSQL "INSERT INTO teams(name)
        SELECT '$OPPONENT'
        WHERE NOT EXISTS(
          SELECT 1 FROM teams WHERE name='$OPPONENT'
        )")
done < games.csv

while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  [[ "$YEAR" =~ ^[0-9]+$ ]] || continue
  GAME_INSERT_RESULT=$($PSQL "INSERT INTO games(year, winner_id, opponent_id, winner_goals, opponent_goals, round)
        VALUES(
        $YEAR, 
        (SELECT team_id FROM teams WHERE name='$WINNER'),
        (SELECT team_id FROM teams WHERE name='$OPPONENT'),
        $WINNER_GOALS, 
        $OPPONENT_GOALS,
        '$ROUND')
        ")
done < games.csv

