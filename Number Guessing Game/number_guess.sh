#!/bin/bash

# PostgreSQL command shortcut
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Function to display menu and prompt for username
MENU() {
    # Display any message passed to the function
    if [[ $1 ]]; then
        echo -e "$1\n"
    fi
    echo "Enter your username:"
    read USERNAME
}

# Function to prompt the user to guess the number
GUESS() {
    # Display any message passed to the function
    if [[ $1 ]]; then
        echo -e "$1"
    else
        echo -e "Guess the secret number between 1 and 1000:"
    fi
    read NUMBER
}

# Start by displaying the menu to get the username
MENU

# Loop until a valid username is entered
while [[ -z $USERNAME ]]; do
    MENU "The username field is required."
done

# Check if the username exists in the database
USER=$($PSQL "SELECT username,games_played,best_game FROM users WHERE username='$USERNAME'")
if [[ -z $USER ]]; then
    # If user does not exist, insert new user into the database
    INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
    echo "Welcome, $USERNAME! It looks like this is your first time here."
else
    # If user exists, retrieve user data from the query result
    IFS='|' read -r -a USER_ARRAY <<<"$USER"
    # Remove leading and trailing whitespace from each element in USER_ARRAY
    for ((i = 0; i <= ${#USER_ARRAY[@]} - 1; i++)); do
        USER_ARRAY[$i]=$(echo ${USER_ARRAY[$i]} | sed -e 's/^+ | +$//')
    done
    # Display a welcome message with user statistics
    echo "Welcome back, ${USER_ARRAY[0]}! You have played ${USER_ARRAY[1]} games, and your best game took ${USER_ARRAY[2]} guesses."
fi

# Generate a random number between 1 and 1000 for the user to guess
GUESS_NUMBER=$((RANDOM % 1000 + 1))
GUESS_COUNT=1

# Prompt the user to guess the number
GUESS

# Loop until the user guesses the correct number
while [[ $NUMBER -ne $GUESS_NUMBER ]]; do
    # Validate if the input is an integer
    if ! [[ $NUMBER =~ ^[0-9]+$ ]]; then
        GUESS "That is not an integer, guess again:"
    elif [[ $NUMBER -lt $GUESS_NUMBER ]]; then
        GUESS "It's higher than that, guess again:"
    elif [[ $NUMBER -gt $GUESS_NUMBER ]]; then
        GUESS "It's lower than that, guess again:"
    fi
    # Increment the guess count after each attempt
    ((GUESS_COUNT++))
done

# Update user's game statistics after the game ends
if [[ -z "${USER_ARRAY}" ]]; then
    # If it's the user's first game, update with initial values
    UPDATE_USER=$($PSQL "UPDATE users SET games_played=1, best_game=$GUESS_COUNT WHERE username='$USERNAME'")
else
    # If the user has played before, calculate games played and update best game if necessary
    GAMES_PLAYED=$((${USER_ARRAY[1]} + 1))
    if [[ $GUESS_COUNT -lt ${USER_ARRAY[2]} ]]; then
        # Update with new best game if current game is better
        UPDATE_USER=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$GUESS_COUNT WHERE username='$USERNAME'")
    else
        # Update games played without changing best game
        UPDATE_USER=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED WHERE username='$USERNAME'")
    fi
fi

# Display final message to user with game result
echo "You guessed it in $GUESS_COUNT tries. The secret number was $GUESS_NUMBER. Nice job!"
