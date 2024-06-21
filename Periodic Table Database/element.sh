#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
  exit 0
fi

ELEMENT_QUERY="SELECT elements.atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius
FROM elements
JOIN properties ON elements.atomic_number = properties.atomic_number
JOIN types ON properties.type_id = types.type_id"

if [[ $1 =~ ^[0-9]+$ ]]; then
  ELEMENT_RESULT=$($PSQL "$ELEMENT_QUERY WHERE elements.atomic_number = $1")
else
  ELEMENT_RESULT=$($PSQL "$ELEMENT_QUERY WHERE symbol = '$1' OR name = '$1'")
fi

if [[ -z $ELEMENT_RESULT ]]; then
  echo "I could not find that element in the database."
else
  IFS="|" read -r ATOMIC_NUMBER NAME SYMBOL TYPE MASS MELTING_POINT BOILING_POINT <<< "$ELEMENT_RESULT"
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
fi
