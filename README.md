# Mise en place du Docker en local

1. Allez pull le projet depuis GitHub sur votre machine.

2. Démarrez Docker (si celui-ci n'est pas démarré de base).

3. Placez vous à la racine du projet <b>"udalost"</b> dans un terminal (cmd par exemple).

4. Entrez et exécutez la commande <b>docker-compose up --no-start</b> et patientez le temps que les images se téléchargent.

<b><i>NOTE (non obligatoire) :</i></b> Une fois la commande précédente terminée, vous pouvez par exemple retrouver les containers en faisant <b>docker-compose ps</b>.

5. Vous pouvez désormais démarrer tous les containers docker nécessaires au projet en faisant <b>docker-compose start</b>.

6. En local, il est nécessaire d'aller modifier son fichier <b>"hosts"</b> (sur windows, ouvrir le fichier en tant qu'administrateur, le chemin est le suivant : <b>C:\Windows\System32\drivers\etc\hosts</b>) afin d'y rajouter les routes nécessaires qui sont les suivantes :

- 127.0.0.1 api.udalost.back
- 127.0.0.1 api.udalost.mobile
- 127.0.0.1 api.udalost.web

7. Allez ensuite exécuter le fichier composer.json pour générer les vendor dans chaque conteneur docker en suivant les indications suivantes :

- Connectez vous au container via la commande <b>docker exec -it udalost_api.udalost.back_1 /bin/bash</b>
- Exécuter le composer.json en faisant <b>composer install</b> puis patientez le temps que cela se termine
- Répétez l'action pour les deux autres API en sortant du container via la commande <b>exit</b> puis en faisant les commandes (<b>docker exec -it udalost_api.udalost.mobile_1 /bin/bash</b> et <b>docker exec -it udalost_api.udalost.web_1 /bin/bash</b>)

8. La dernière étape est d'aller importer la base de données via phpMyAdmin. Pour cela suivez les indications ci-après :

- Allez sur l'url suivante : <a href="http://localhost:10480/">http://localhost:10480/</a>
- Connectez vous en entrant dans les deux champs (utilisateur et mot de passe) : <b>udalost</b>
- Allez dans la section <b>"Importer"</b>
- Importez en premier le schéma de la base de données (<b>schema_bd_udalost.sql</b>) que vous trouverez dans le dossier <b>"sql"</b> à la racine du projet puis appuyez sur le bouton exécuter
- Retournez dans la section <b>"Importer"</b>
- Importez cette fois-ci les données de la base de données (<b>donnees_bd_udalost.sql</b>) qui sont toujours dans le même dossier <b>"sql"</b>

9. L'installation est terminée, vous pouvez accéder aux API, à la base de données et le front-end dont voici les URL :

- API back : <a href="https://api.udalost.back:10043/">https://api.udalost.back:10043/</a>
- API mobile : <a href="https://api.udalost.mobile:10143/">https://api.udalost.mobile:10143/</a>
- API web : <a href="https://api.udalost.web:10243/">https://api.udalost.web:10243/</a>
- phpMyAdmin : <a href="http://localhost:10480/">http://localhost:10480/</a>
- Front-end : <a href="http://localhost:10380/">http://localhost:10380/</a>
