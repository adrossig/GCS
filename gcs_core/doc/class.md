## Class

Pour des raisons d'organisation, de clarté et d'extensibilité future nous utiliserons un système de class pour éviter du code flottant.

```lua
local inc = 0

function incrementation(value)
	inc = inc + 1
end
```

Ça c'est nul du code flottant qui correspond à rien, c'est pas claire, pas organiser nul nul nul.
A la place ca peut-être fait en class :

```lua
Incrementation = class()

function Incrementation:__init()
	self.inc = 0
end

function Incrementation:Incrementer(value)
	self.inc = self.inc + value
end

function Incrementation:Decrementer(value)
	self.inc = self.inc - value
end
```

Ici, nous créons une nouvelle class appelée Incrementation.
N'importe quel module du gamemode peut utiliser cette classe, il est donc important que nous choisissions un nom unique qui ne soit pas utilisé ailleurs.

La première ligne indique que nous voulons définir une class.
Si nous voulons qu'elle hérite d'une autre classe, nous passons le nom de cette classe dans les parenthèse de l'appel class().

La ligne suivante est la fonction d'initialisation de la class. Chaque class doit avoir cette méthode.
Cette méthode est appelée lorsque vous initialisez pour la première fois une instance d'une class, comme ceci :

```lua
local total_death = Incrementation()
```

Dans l'exemple ci-dessus, il crée une nouvelle classe Incrementation et appelle en interne la fonction __init(), en fixant la variable inc à 0.
Maintenant, afin d'incrémenter notre compteur, nous devons faire :

```lua
total_death:Incrementer(1)
```

Maintenant, la variable interne de notre compteur est à 1, bien.
Nous pouvons faire autant de compteurs que nous voulons maintenant, tous les conteur sont indépendent donc aucune interférence entre eux.

Pour accèder à la valeur de notre compteur il suffit juste de faire :

```lua
local counter = total_death.inc
```

Une autre façon de faire serait d'utiliser les getters / setters, comme le suit :

```lua
Incrementation = class()

function Incrementation:__init()
	getter_setter(self, "inc")
end

function Incrementation:Incrementer(value)
	self.inc = self.inc + value
end

function Incrementation:Decrementer(value)
	self.inc = self.inc - value
end
```

Maintenant pour récupérer la valeur interne du compteur il faut faire :

```lua
local counter = total_death:GetCount()
```

Pour le reset il suffit de faire :

```lua
local counter = total_death:SetCount(0)
```

Tout aussi cool que papa dans maman !! KAPPA

# Singleton

Pour convertir le code de la class en utilisable sans effort à la différence d'esx :

```lua
local money = 100
local continental_coin = 1

-- Called when the player gets money
function PlayerGetMoney(value)
	money = money + value
	print(string.format("Vous avez obtenu %d d'argent ! Vous avez maintenant un total de %d.", value, money))
end

-- Called when the player gets money
function PlayerGetMoney(value)
	continental_coin = continental_coin + value
	print(string.format("Vous avez obtenu %d continental coin ! Vous avez maintenant un total de %d.", value, continental_coin))
end
```

Nous avons ici deux functions qui modifie la valeur de nos variable.
Pour pouvoir les utilisées en permanance avec une seul execution ont peut faire :

```lua
PlayerMoney = class()

function PlayerMoney:__init(starting_money, starting_coins)
	getter_setter(self, "money")
	getter_setter(self, "coins")
	self:SetMoney(starting_money)
	self:SetCoins(starting_coins)
end

function PlayerMoney:PlayerGetMoney(amount)
	self:SetMoney(self:GetMoney() + amount)
	print(string.format("Vous avez obtenu %d d'argent ! Vous avez maintenant un total de %d.", amount, self:GetMoney()))
end

function PlayerMoney:PlayerGetGem()
	self:SetCoins(self:GetCoins() + 1)
	print(string.format("Vous avez obtenu %d continental coin ! Vous avez maintenant un total de %d.", self:SetCoins())
end

PlayerMoney = PlayerMoney(10, 2)
```

Maintenant que tout le monde comprends le code ci-dessus j'me casse au bahamas!
Les seuls éléments nouveaux sont le singleton et les arguments du constructeur de la class.

Le singleton est établi à la dernière ligne, où nous définissons la classe égale à une instance de la classe.
Cela crée une nouvelle instance de la classe et assure que nous ne pouvons pas créer une autre instance de celle-ci car la classe originale a été écrasée.

Cette classe est initialisée avec deux arguments : 10 et 2.
Ils entrent dans le constructeur __init() dans le même ordre que celui dans lequel ils sont passés, et sont utilisables à cet endroit.
Dans le constructeur, vous pouvez voir que nous avons défini nos deux variables internes avec les valeurs transmises.

Une autre chose le gamemode fait est une surcharge de l'appel print(). Nous y ajoutons le nom de la ressource et l'horodatage pour un meilleur débogage.

