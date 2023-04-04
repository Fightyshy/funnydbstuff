#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

RESULTS_ECHOER(){
    # checker for nulls
    if [[ -z $1 ]]
    then
        echo "I could not find that element in the database."
    else
        echo $1 | while IFS="|" read ANUM NAME SYMBOL TYPE AMASS MPC BPC
        do
            echo -e "The element with atomic number $ANUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $AMASS amu. $NAME has a melting point of $MPC celsius and a boiling point of $BPC celsius."
        done
    fi
    
}

if [[ -z $1 ]]
then
    echo "Please provide an element as an argument."
elif [[ $1 =~ (^[1-9])|([0-9]+) ]]
then
    ELEMENT_DATA_AM=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements
                                INNER JOIN properties using(atomic_number)
                                INNER JOIN types using(type_id)
                                WHERE atomic_number=$1")
    RESULTS_ECHOER "$ELEMENT_DATA_AM"
elif [[ $1 =~ [A-Za-z]{3,} ]]
then
    ELEMENT_DATA_NAME=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements
                                INNER JOIN properties using(atomic_number)
                                INNER JOIN types using(type_id)
                                WHERE name='$1'")
    RESULTS_ECHOER "$ELEMENT_DATA_NAME"
else
    ELEMENT_DATA_SYMBOL=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements
                                INNER JOIN properties using(atomic_number)
                                INNER JOIN types using(type_id)
                                WHERE symbol='$1'")
    RESULTS_ECHOER "$ELEMENT_DATA_SYMBOL"
fi
