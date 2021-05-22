# UI

Le gamemode est accompagner de sont propre système de gestion d'UI. 
Ce qui rend la gestion d'ui plus simple à utilisé.
Grace à ce système nous allons pouvoir créer un nombre d'élément WEB infini, avec des events simple pour faire des transferts de donnée entre les scripts LUA / JS.

### Affichage de données simples sur les joueurs.

Pour nous familiariser avec le système d'interface utilisateur, créons une interface simple qui affiche le nom du joueur et un message de bienvenue.

Pour ce faire, nous devons créer quelques fichiers. Nous allons faire simples pour cet exemple, mais cela devrait nopus donner une idée simple sur la façon dont les choses fonctionnent. Il y a quelques modules, tels que screen et chat, qui sont d'excellentes ressources d'exemple.

Créons un nouveau module appelé welcome pour cet exemple.
À l'intérieur, l'arborescence des fichiers devrait ressembler à ceci :

```
welcomemessage
--\ client
	-- module.lua
	--\ html
		--\ css
			-- style.css
		--\ js
			-- script.js
		-- index.html
```

Allons faire un tour dans le fichier `module.lua`

```lua
WelcomeMessage = class()

function WelcomeMessage:__init()
	-- Créer l'Instance UI et la stocke dans notre classe pour un accès facile.
	self.ui = UI:Create({name = "welcome_message", path = "welcomemessage/html/index.html"})

	-- Attendez que l'interface utilisateur soit prête pour appeler l'événement. Si nous appelons un événement avant que l'interface ne soit chargée, cela pourrait ne pas fonctionner.
	self.ui:Subscribe('Ready', function()
		self:UIReady()
	end)

	-- Control.Jump est normalement un espace, nous allons donc l'utiliser ici.
	self.key_to_hide = Control.Jump

	-- D'abord, dites à KeyPress de rechercher cette touche.
	KeyPress:Subscribe(self.key_to_hide)

	-- Ensuite, souscrivez à l'événement KeyUp, qui sera appelé par KeyPress lorsque la touche est enfoncée et que vous la relâchez.
	Events:Subscribe('KeyUp', function(args)
		self:KeyUp(args)
	end)

	self.welcome_message = "Bonjour %s ! Bienvenue sur le serveur ! Appuyez sur Espace pour cacher ceci."
end

function WelcomeMessage:UIReady()
	-- CallEvent sur l'IU pour envoyer le message que nous voulons afficher
	self.ui:CallEvent("DisplayMessage", 
	{
		message = string.format(self.welcome_message, LocalPlayer:GetPlayer():GetName())
	})
end

function WelcomeMessage:KeyUp(args)
	-- Masquer le message de bienvenue lorsque la touche est enfoncée. Vous pouvez également faire cela en JavaScript, mais nous montrons ici plus d'API
	if args.key == self.key_to_hide then
		self.ui:Hide()
	end 
end

-- Initialisez-le comme un singleton, car il s'agit essentiellement d'un "gestionnaire de messages de bienvenue".
WelcomeMessage = WelcomeMessage()
```

Maintenant fessont un tour dans le fichier `index.html`.

```html
<html>
	<!-- Load jQuery from GCS UI. Optional, but highly recommended -->
	<script src="../../../GCS_framework/html/ui/jquery.js" type="text/javascript"></script>
	<script src="script.js" type="text/javascript"></script>
	<link rel="stylesheet" href="style.css" type="text/css">
	<body>
		<div class='welcome-message'></div>
	</body>
</html>
```

Le fichier `style.css`.

```css
/* Style de base pour le faire apparaître au milieu de l'écran. */
div.welcome-message
{
	display: flex;
	justify-content: center;
	align-content: center;
	background: #ff0000;
	color: #ffffff;
	font-weight: bold;
	border: 0.25rem solid #ffa500;
	font-size: 2.5rem;
	padding: 1.25rem;
}
```

On utilise `rem` pour du responsive sur ce qui est gestion d'espace et de taille.
Pour les couleurs c'est mieux d'utiliser les Hex code, c'est 4 à 5 fois plus rapide.
Pour finir, si l'ont veut positionner correctement une balise il nous faut 3 lignes grace à 

```css
display: flex;
justify-content: center;
align-content: center;
```

Maintenant nous pouvons aller faire un petit tour dans le fichier `script.js`.

```js
// Enveloppez tout le script dans le .ready() pour vous assurer que le chargement est terminé.
$(document).ready(function() 
{
	// Souscrivez à l'événement DisplayMessage pour recevoir les données de Lua.
	GCS.Subscribe("DisplayMessage", (data) => 
	{
		// Utiliser jQuery pour définir le texte de notre message de bienvenue
		$('div.welcome-message').text(data.message);
	})

	// Appelez l'événement Ready en bas du script après que tout ait été chargé.
	// Cela indique au Lua que cette interface est prête à être utilisée.
	GCS.CallEvent("Ready");
})
```

Si vous avez tout fait correctement, vous devriez voir apparaître un message de bienvenue avec votre nom lorsque vous rechargez la ressource et rejoignez le serveur ! Et si vous appuyez sur espace, il disparaîtra !

Pas si compliquer le super système de gestion d'UI hein ?!
Pour les références il faut consulter le wiki github :)

Car moi être pauvre et ne peut pas payer un hébergement correct pour ce putain de wiki KAPPA

