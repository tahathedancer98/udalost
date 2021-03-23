# Mise en place du Docker en local

1. Allez pull le projet depuis GitHub sur votre machine.

2. Démarrez Docker (si celui-ci n'est pas démarré de base).

3. Placez vous à la racine du projet <b>"udalost"</b> dans un terminal (cmd par exemple).

4. Entrez et exécutez la commande <b>docker-compose up --no-start</b> et patientez le temps que les images se téléchargent.

<b><i>NOTE (non obligatoire) :</i></b> Une fois la commande précédente terminée, vous pouvez par exemple retrouver les containers en faisant <b>docker-compose ps</b>.

5. Vous pouvez désormais démarrer tous les containers docker nécessaires au projet en faisant <b>docker-compose start</b>.

6. En local, il est nécessaire d'aller modifier son fichier <b>"hosts"</b> (sur windows, ouvrir le fichier en tant qu'administrateur, le chemin est le suivant : <b>C:\Windows\System32\drivers\etc\hosts</b>) afin d'y rajouter les routes nécessaires qui sont les suivantes :

- 127.0.0.1 api.udalost.back
  Implanter encore les autres routes ICI

7. Allez ensuite exécuter le fichier composer.json pour générer les vendor dans chaque conteneur docker en suivant les indications suivantes :

- Connectez vous au container via la commande <b>docker exec -it udalost_api.udalost.back_1 /bin/bash</b>
- Exécuter le composer.json en faisant <b>composer install</b> puis patientez le temps que cela se termine
- Répétez l'action pour les autres API donc en modifiant la commande du docker exec -it (à déterminer encore)

8. L'installation est terminée, vous pouvez accéder aux API ainsi qu'à la base de données dont voici les URL :

- <a href="https://api.udalost.back:10043/">https://api.udalost.back:10043/</a>
- Rajouter ICI les autres API
- <a href="http://localhost:10380/">http://localhost:10380/</a> => phpMyAdmin
