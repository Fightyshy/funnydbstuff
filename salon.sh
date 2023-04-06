#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"

MAIN_MENU(){
  echo -e "1) cut\n2) color\n3) perm\n4) style\n5) trim"
  read SERVICE_ID_SELECTED

  if [[ ! $SERVICE_ID_SELECTED =~ ^[1-6]$ ]]
  then
    echo -e "\nI could not find that service. What would you like today?"
    MAIN_MENU
  elif [[ $SERVICE_ID_SELECTED == 1 ]]
  then
    SERVICE_CUT
  fi
}

# for every option but exit, include:
# func for that option with return to main menu on invalid entries

NEW_CUSTOMER_INSERT(){
  echo -e "\nI don't have a record for that phone number, what's you're name?"
  read CUSTOMER_NAME
  echo -e "\n I will record down your particulars, thank you for choosing us!"
  INSERT_NEW_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$1','$CUSTOMER_NAME')")
}

SCHEDULER(){
  ERROR_MSG_TIME="\nAn invalid time was entered, please try again. You should enter it as either 10:30 or 11am, for example: "
  SERVICE_TIME=$3
  # it didn't want to play nice, from the deepest pits of rage, I despise regex checking
  # if [[ ! $SERVICE_TIME =~ ^([1-9]|0[1-9]|1[0-2])([AaPp][Mm])$ || ! $SERVICE_TIME =~ ^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$ ]]
  # then
  #   echo -e $ERROR_MSG_TIME
  #   read SERVICE_TIME
  #   SCHEDULER "$1" "$2" "$SERVICE_TIME"
  # else
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $2")
    echo -e "I have put you down for a $SERVICE_NAME at $3, $1."
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME',$4,$2)")
  # fi
}

SERVICE_CUT(){
  echo -e "\nWhat's your phone number"
  read CUSTOMER_PHONE
  # look for customer id using phone number
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  # check for null
  if [[ -z $CUSTOMER_ID ]]
  then
    NEW_CUSTOMER_INSERT "$CUSTOMER_PHONE"
  fi

  # maybe optimise?
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  # echo -e "\nWhat time would you like to schedule?"
  echo -e "\nWhat time would you like for your appointment? Please enter using the 24hr clock or with a number and AM/PM: "
  read SERVICE_TIME
  SCHEDULER "$CUSTOMER_NAME" "$SERVICE_ID_SELECTED" "$SERVICE_TIME" "$CUSTOMER_ID"
}

MAIN_MENU