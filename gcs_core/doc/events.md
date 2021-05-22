# Events

Nous utilisons un système d'événements personnalisé à la place du système d'événements par défaut.
Ce système est entièrement intégré au système de classe afin que nous puissions obtenir toutes les informations dont nous avez besoin lorsque des événements sont organisés.


## Événements hors réseau

Les événements hors réseau sont des événements qui n'existent que sur le serveur ou le client. Ils ne sont pas utilisés pour transférer des données entre les deux - ce sont des événements réseau.
Les événements hors réseau sont parfaits pour transmettre des données entre les modules ou pour déclencher d'autres actions en fonction de certaines conditions.

Par exemple dans le module `events` si nous regardons le fichier client, nous nous appercevons qu'un bon nombre d'events est faites.

```lua
Events:Subscribe("PedDied", function(args)
	-- Logic here
end)
```

Le snippet ci-dessus s'abonne à un events nommé `"PedDied"` présent dans le module events.
Cette évènement ce déclanche lorsqu'il détecte qu'un ped est mort. Le module transmet aussi un paramètre spécifiant qu'elle ped est mort.
C'est pratique pour vérifier quel type de ped est mort et faire des actions en fonction de celui-ci.

Grace à la class ped déjà définit nous pouvons faire par exemple : 

```lua
Events:Subscribe("PedDied", function(args)
	local ped_pos = args.ped:GetPosition()
	print(string.format("Ped died! Position: X: %.0f, Y: %.0f, Z: %.0f", ped_pos.x, ped_pos.y, ped_pos.z))
end)
```

Dans le snippet ci-dessus, nous obtenons maintenant la position du ped au moment de sa mort, et nous l'imprimons dans la console !

Si vous souhaitez créer vos propres événements réseau, c'est très facile à faire !

#### `Events:Fire(event_name, data)`

- Déclenche un événement dans tous les modules, côté serveur ou côté client, en fonction de l'endroit où il a été appelé.

- `event_name` (string) : nom de l'événement. Doit correspondre à l'abonnement à l'événement à déclencher.

- `data` (tableau, facultatif) : tableau des données que vous souhaitez envoyer avec l'événement.

## Network Events

Comment envoyer des données du serveur au client, ou du client au serveur ?
Nous avons quelques solutions différentes pour cela.


#### `Network:Send(event_name, target(s), data)`
- Server ONLY
- Envoie des données à un ou plusieurs clients spécifiques
- `event_name` (string) : nom de l'événement. Doit correspondre à l'abonnement du client à déclencher.
- `target(s)` (player_id ou table des ids du player ou Player) : client(s) cible(s) auquel (auxquels) les données seront envoyées.
- `data` (table) : table de données à envoyer au(x) client(s). Ne prend en charge que les types de données primitifs tels que les nombres, les chaînes de caractères et les tableaux. Veillez donc à convertir au préalable un type de classe en un format sérialisable.

#### `Network:Broadcast(event_name, data)`
- Serveur UNIQUEMENT
- Envoie des données à tous les clients.
- `event_name` (string) : nom de l'événement. Doit correspondre à l'abonnement du client au déclencheur.
- `data` (table) : table de données à envoyer aux clients. Ne prend en charge que les types de données primitifs comme les nombres, les chaînes de caractères et les tableaux. Veillez donc à convertir au préalable un type de classe en un format sérialisable.

#### `Network:Send(nom_de_l'événement, données)`
- Client UNIQUEMENT
- Envoie des données au serveur depuis le client
- `event_name` (string) : nom de l'événement. Doit correspondre à l'abonnement du serveur pour déclencher
- `data` (table) : table des données à envoyer au serveur. Ne prend en charge que les types de données primitifs comme les nombres, les chaînes de caractères et les tableaux. Veillez donc à convertir au préalable un type de classe en un format sérialisable.

Ce sont toutes des méthodes globales pour envoyer des données. Voyons maintenant comment recevoir des données.

Voici un petit extrait de code qui illustre un effet de type "ping-pong".

```lua
-- Serverside
TestPingPongServer = class()
function TestPingPongServer:__init()

	Network:Subscribe("Pong", function(args) self:Pong(args) end)

	Events:Subscribe("ClientModulesLoaded", function(args) self:ClientModulesLoaded(args) end)
end

-- Événement déclenché par le gamemode lorsqu'un joueur a fini de charger tous ses scripts après s'être connecté.
function TestPingPongServer:ClientModulesLoaded(args)
	Network:Send("Ping", args.player, {
		ping_message = "hello from server!"
	})
end

-- Récepteur d'événements réseau lorsqu'un client appelle "Pong".
function TestPingPongServer:Pong(args)
	print(string.format("Pong! Message from %s: %s", args.player:GetName(), args.pong_message))
end

-- Singleton
TestPingPongServer = TestPingPongServer()

-------------
-- Clientside
TestPingPongClient = class()
function TestPingPongClient:__init()
	Network:Subscribe("Ping", function(args) self:Ping(args) end)
end

function TestPingPongClient:Ping(args)
	print(string.format("Ping! Message: %s", args.ping_message))

	Network:Send("Pong", {
		pong_message = "hello from client!"
	})
end

-- Singleton
TestPingPongClient = TestPingPongClient()
```

Il y a beaucoup de choses qui se passent dans cet exemple, alors décomposons-les.

Le code côté serveur crée une class singleton et ajoute deux abonnements dans l'initialisation.
Ces abonnements sont liés à des noms d'événements spécifiques qui sont spécifiés comme premiers arguments. 

`Network:Subscribe(event_name, callback)` : 

S'abonne à un événement réseau qui est appelé par les clients.
Lorsqu'il est appelé, la fonction de rappel est déclenchée. La fonction de rappel comprend un tableau de données qui inclut le `player` (l'instance de Player du client qui a envoyé les données) et toute donnée que le player a également envoyée.

`Events:Subscribe(event_name, callback)` : 

Fonctionne de manière similaire, sauf qu'il ne fonctionne que du côté serveur ou du côté client. Dans ce cas, nous nous abonnons à l'événement 

`ClientModulesLoaded` : 

Que le gamemode appelle lorsqu'un client a fini de charger tous ses scripts et est prêt à recevoir des données.

L'exécution du code ressemble à ceci :
1. Le serveur charge ses scripts et crée le singleton `TestPingPongServer`.
2. Le singleton `TestPingPongServer` s'initialise et s'abonne aux deux événements.
3. Un client se connecte, télécharge et exécute tous les scripts. Cela inclut l'installation du singleton, ainsi que les abonnements aux événements.

Le flux de code est très similaire aux événements de mise en réseau par défaut de FiveM puisque le gamemode les utilise en interne. La syntaxe est juste un peu différente de celle à laquelle vous êtes habitué et comporte quelques fonctionnalités supplémentaires. Il est important que vous compreniez le fonctionnement des événements, car ils constituent un élément clé de tout mode de jeu.
