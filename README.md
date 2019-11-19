# Operációs rendszerek gyakorlat Shell script

A repo-ban található script kétféle módon működik. 

1. Beolvassa az adatokat az email küldéséhez a billentyűzetről
2. Beolvassa az adatokat az emailek.log fájlból, és automatikusan kiküldi az összes üzenetet

Emailek.log felépítése:

* 1. érték: címzett email címe
* 2. érték: email tárgya
* 3. érték: email üzenet

Ezek a fájlba pontosvesszővel elválasztva kell, hogy bekerüljenek!

A program a mailgun API szolgáltatást használja az emailek küldéséhez.

