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
    emailCounter=$((emailCounter+1))
    echo "$emailCounter. üzenet küldése"
    RESPONSE=`curl -fSs --user 'api:980ac2043c279591ba48555f9f0affda-09001d55-ec4b639e' \
        https://api.mailgun.net/v3/sandboxee0fa03278b6491c93e4dd2b6d1c73d2.mailgun.org/messages \
        -F from="$KITOL" \
        -F to="$cimzett" \
        -F subject="$targy" \
        -F text="$uzenet"`

    if [ $? -gt 0 ]; then
    echo "Hiba történt: $RESPONSE"
    exit 1
    fi
done <emailek.log
echo "Emailek kiküldve"