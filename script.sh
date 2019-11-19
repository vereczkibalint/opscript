#!bin/bash

KITOL="OPRendszer Script <mailgun@sandboxee0fa03278b6491c93e4dd2b6d1c73d2.mailgun.org>"

KINEK=""
TARGY=""
UZENET=""


: 'while true
do
    read -p "Címzett: " cimzett
    if [[ "$cimzett" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$ ]]
    then
        break
    else
      echo "Hibás email formátum!"
    fi
done

while [ -z "$targy" ]
do
  read -p "Tárgy: " targy
done

while [ -z "$uzenet" ]
do
  read -p "Üzenet: " uzenet
done'

echo "Emailek beolvasása"
emailCounter=0
while IFS=';' read -r cimzett targy uzenet
do
    if [[ "$cimzett" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$ ]]
    then
      emailCounter=$((emailCounter+1))
      echo "$emailCounter. üzenet küldése"
      RESPONSE=`curl -fSs --user 'api:key-fdf52eb232c49f2ede4e9e508eb52a37' \
          https://api.mailgun.net/v3/sandboxee0fa03278b6491c93e4dd2b6d1c73d2.mailgun.org/messages \
          -F from="$KITOL" \
          -F to="$cimzett" \
          -F subject="$targy" \
          -F text="$uzenet"`

      if [ $? -gt 0 ]; then
      echo "Hiba történt: $RESPONSE"
      exit 1
      fi
    else
      echo "Hibás email cím formátum!"
    fi
done <emailek.log
echo "Emailek kiküldve"