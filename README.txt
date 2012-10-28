Architecture de notre projet :

Notre projet respecte le pattern MVC. Nous avons donc distinctement une partie Model, une partie Vue
et une partie Contrôleur. Nous avons utilisé le FrameworkSping MVC et nous avons procédé par annotation. 
Il est alors plus simple d’associer une requête à une action. 



Le model :

Notre model est composé de deux classes Java, l’une pour les contacts, l’autre pour les adresses.

Contacts
•	Nom : String
•	Prenom : String
•	Email : String
•	Pseudo : String
•	Password : String
•	Id : Integer
•	IdAmis : ArrayList<Integer>


Message
•	Message: String
•	Id : Integer
•	IdDestinateur: Integer
•	IdAuteur: Integer


Nous avons ajouté des attributs Id dans chaque objet. Ces attributs permettent d’associer une valeur unique
à un objet et ainsi pouvoir plus facilement le manipuler et le reconnaître. L’attribut IdAuteur du message
contient l’Id du contact qui en est l’auteur. Cela permet de retrouver facilement à qui un message appartient.
L’attribut IdDestinateur sera utilisé pour la fonctionnalité permettant d’envoyer des messages privés, car 
il contient l’Id du destinataire du message.

La base de données étant simulée par des HashMaps, les Ids font office de clé pour les objets Contacts et Message.
Avec les méthodes offertes par les HashMap, il est facile de retrouver les contacts, les messages et les liens
entre ces deux objets, mais aussi de supprimer ou d’ajouter de nouveaux éléments ou encore de mettre à jour
ceux qui sont déjà dans la map.



Les contrôleurs :

Nous avons implémenté deux contrôleurs principaux. 

Le premier, appeler ForwardController, ne sert qu’à effectuer des redirections. Il renvoie simplement les jsp
associées aux actions de l’utilisateur. 
Par exemple, lorsque l’utilisateur clique sur « Ajouter un nouveau contact », on ne fait que le renvoyer
simplement sur le formulaire d’ajout de contact.

Le second contrôleur, appelé ContactsAppController, est plus applicatif.
Il s’occupe de récupérer les entrées de l’utilisateur et de déclencher les actions permettant la modification
du model de donnée. Il est appelé lors de l’ajout, la modification ou la suppression des données. 
C’est lui qui déclenche les actions qui vont lire les HashMaps des contacts et des messages et les modifier.



Les vues :

L’ensemble de nos vues est composé de fichiers jsp. On peut les regrouper en 3 catégories : Les formulaires
d’entrée, les formulaires de mise à jour et les afficheurs.

Les formulaires d’entrée sont les plus simples. Ils ne présentent aucune donnée et ne font que récupérer les
données entrées par l’utilisateur. Elles sont utilisées lors de la création d’un contact, l’ajout d’un message
ou lors d’une recherche.

Les formulaires de mise à jour affichent les données d’un contact ou d’une adresse et permettent d’effectuer des
modifications. Elles sont appelées uniquement lors de la modification d’un contact ou d’une adresse.

Les afficheurs ne permettent pas à l’utilisateur d’entrée des données. Ils se contentent d’afficher la liste des
contacts ou des messages qu’on leur a préalablement passés.



Les fonctionnalités :


Notre applications permet d'ajouter un compte, de se logger, d'ajouter et de supprimer des amis qui ont déjà un compte sur 
l'application.

Une fois son reseau d'amis créé, on peut soit envoyer un message privée à un ami donnée, soit poster un message
public visible par toute les personnes qui m'ont ajouter dans leur liste d'ami.

On peut aussi accédé à la liste de tous ses messages et les supprimer un à un.

On peut aussi rechercher un compte à l'aide de la barre de recherche parmis tous les compte existant.

Nous avons aussi implémenter des objets JSON( voir Les Objets JSON).



Les Objets Json :

Nous avons aussi proposé une implémentation d’objets Json afin que la modélisation des données
que nous avons réalisée puisse être utilisée par une application mobile par exemple.

Les fonctions JSON peuvent être appelées par printContactsJSON et printMessagesJSON qui retourneront
 une liste de tous les contacts pour printContactsJSON et de tous les messages pour printMessagesJSON.

Le développeur de l’application n’auras plus qu’a traité les données ainsi récupérées pour en faire 
se qu’il souhaite.
