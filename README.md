# The Hacking Gossip sur Rails avec la gem Devise

![Gossip](https://nsa39.casimages.com/img/2018/08/05/18080510054168495.png)

## Comment tester ? 🤔

* l'app en ligne sur heroku : https://radiant-caverns-27981.herokuapp.com
* le code promo pour s'inscrire : "petitcurieux"
* pour les tests : ```rails test '/user_test.rb'```. Ils vérifient que :
    * à l'inscription, l'uilisateur est renvoyé vers la liste des gossips
    * l'index des gossips affiche bien tous les gossips, mais lorsque l'utilisateur est connecté via le code promo seulement
    * le créateur d'un gossip peut le supprimer
    * un utilisateur peut bien s'enregistrer avec le code promo
    * pour pouvoir s'inscrire : le mail doit être unique et obligatoire + username obligatoire

> tout fonctionne bien normalement 🎈

## Les consignes 📚
Faire un site qui permettra aux matelots de poster des gossips de manière anonyme.
La page d'accueil du site doit être :
* un warning qui dit : "Hey bro connecte-toi ou inscris-toi !" si la personne n'est pas logguée
* la liste de tous les gossips si la personne est login

Une fois login/signup, l'utilisateur est redirigé vers la liste de tous les gossips. Dans cet index, tu pourras retrouver une liste de tous les gossips, avec la date d'ajout, le username de la personne qui a posté le gossip, et un lien pour supprimer le gossip si l'auteur est login.

Le site aura un petit header qui contient :

* Si la personne est login :
  * un lien pour créer un gossip
  * un lien pour se logout
* Si la personne n'est pas login :
  * un lien pour se login
> Bien entendu, l'intégralité du site n'est accessible uniquement si la personne est login. Le site redirigera vers la page "Hey bro connecte-toi ou inscris-toi !" si la personne n'est pas logguée.

## Amuse toi à balancer des bons potins des familles sur tes potes de THP

💌
