#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Check if argument is given
if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
  exit
fi

# Determine the search condition
if [[ $1 =~ ^[0-9]+$ ]]; then
  CONDITION="e.atomic_number = $1"
elif [[ $1 =~ ^[A-Za-z]{1,2}$ ]]; then
  CONDITION="e.symbol ILIKE '$1'"
else
  CONDITION="e.name ILIKE '$1'"
fi

# Query the element
ELEMENT=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, t.type,
TRIM(TRAILING '0' FROM TRIM(TRAILING '.' FROM p.atomic_mass::TEXT)),
p.melting_point_celsius, p.boiling_point_celsius
FROM elements e
JOIN properties p ON e.atomic_number = p.atomic_number
JOIN types t ON p.type_id = t.type_id
WHERE $CONDITION;")
# Check if the element exists
if [[ -z $ELEMENT ]]; then
  echo "I could not find that element in the database."
  exit
fi

# Read and format the result
IFS='|' read ATOMIC_NUMBER NAME SYMBOL TYPE MASS MELT BOIL <<< "$ELEMENT"

echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."

#SUCCESSFULLY TESTED IT IS GIVEN THE EXACT SAME RESULT