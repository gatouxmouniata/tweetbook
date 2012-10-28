Architecture de notre projet :

Notre projet respecte le pattern MVC. Nous avons donc distinctement une partie Model, une partie Vue
et une partie Contr�leur. Nous avons utilis� le FrameworkSping MVC et nous avons proc�d� par annotation. 
Il est alors plus simple d�associer une requ�te � une action. 



Le model :

Notre model est compos� de deux classes Java, l�une pour les contacts, l�autre pour les adresses.

Contacts
�	Nom : String
�	Prenom : String
�	Email : String
�	Pseudo : String
�	Password : String
�	Id : Integer
�	IdAmis : ArrayList<Integer>


Message
�	Message: String
�	Id : Integer
�	IdDestinateur: Integer
�	IdAuteur: Integer


Nous avons ajout� des attributs Id dans chaque objet. Ces attributs permettent d�associer une valeur unique
� un objet et ainsi pouvoir plus facilement le manipuler et le reconna�tre. L�attribut IdAuteur du message
contient l�Id du contact qui en est l�auteur. Cela permet de retrouver facilement � qui un message appartient.
L�attribut IdDestinateur sera utilis� pour la fonctionnalit� permettant d�envoyer des messages priv�s, car 
il contient l�Id du destinataire du message.

La base de donn�es �tant simul�e par des HashMaps, les Ids font office de cl� pour les objets Contacts et Message.
Avec les m�thodes offertes par les HashMap, il est facile de retrouver les contacts, les messages et les liens
entre ces deux objets, mais aussi de supprimer ou d�ajouter de nouveaux �l�ments ou encore de mettre � jour
ceux qui sont d�j� dans la map.



Les contr�leurs :

Nous avons impl�ment� deux contr�leurs principaux. 

Le premier, appeler ForwardController, ne sert qu�� effectuer des redirections. Il renvoie simplement les jsp
associ�es aux actions de l�utilisateur. 
Par exemple, lorsque l�utilisateur clique sur � Ajouter un nouveau contact �, on ne fait que le renvoyer
simplement sur le formulaire d�ajout de contact.

Le second contr�leur, appel� ContactsAppController, est plus applicatif.
Il s�occupe de r�cup�rer les entr�es de l�utilisateur et de d�clencher les actions permettant la modification
du model de donn�e. Il est appel� lors de l�ajout, la modification ou la suppression des donn�es. 
C�est lui qui d�clenche les actions qui vont lire les HashMaps des contacts et des messages et les modifier.



Les vues :

L�ensemble de nos vues est compos� de fichiers jsp. On peut les regrouper en 3 cat�gories : Les formulaires
d�entr�e, les formulaires de mise � jour et les afficheurs.

Les formulaires d�entr�e sont les plus simples. Ils ne pr�sentent aucune donn�e et ne font que r�cup�rer les
donn�es entr�es par l�utilisateur. Elles sont utilis�es lors de la cr�ation d�un contact, l�ajout d�un message
ou lors d�une recherche.

Les formulaires de mise � jour affichent les donn�es d�un contact ou d�une adresse et permettent d�effectuer des
modifications. Elles sont appel�es uniquement lors de la modification d�un contact ou d�une adresse.

Les afficheurs ne permettent pas � l�utilisateur d�entr�e des donn�es. Ils se contentent d�afficher la liste des
contacts ou des messages qu�on leur a pr�alablement pass�s.



Les fonctionnalit�s :


Notre applications permet d'ajouter un compte, de se logger, d'ajouter et de supprimer des amis qui ont d�j� un compte sur 
l'application.

Une fois son reseau d'amis cr��, on peut soit envoyer un message priv�e � un ami donn�e, soit poster un message
public visible par toute les personnes qui m'ont ajouter dans leur liste d'ami.

On peut aussi acc�d� � la liste de tous ses messages et les supprimer un � un.

On peut aussi rechercher un compte � l'aide de la barre de recherche parmis tous les compte existant.

Nous avons aussi impl�menter des objets JSON( voir Les Objets JSON).



Les Objets Json :

Nous avons aussi propos� une impl�mentation d�objets Json afin que la mod�lisation des donn�es
que nous avons r�alis�e puisse �tre utilis�e par une application mobile par exemple.

Les fonctions JSON peuvent �tre appel�es par printContactsJSON et printMessagesJSON qui retourneront
 une liste de tous les contacts pour printContactsJSON et de tous les messages pour printMessagesJSON.

Le d�veloppeur de l�application n�auras plus qu�a trait� les donn�es ainsi r�cup�r�es pour en faire 
se qu�il souhaite.
