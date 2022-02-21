## Utilisation

```sh
#!/usr/bin/env bash

source 'path/to/consoleColor.sh'

echo -e "$(color -c red -s b je suis en rouge et en gras), et moi je suis normal !"git

```

### Options

| option | description |
|---|---|
| **-c** | Permet de choisir la couleur parmi la liste suivante : default, black, red, green, yellow, blue, magenta, cyan, grey |
| **-s** | Permet de choisir le style parmi la liste suivante : bold, dim, underlined, blink, inverted, hidden |