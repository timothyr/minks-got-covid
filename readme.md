## Minks Got Covid

Save the Mink from slaughter by sharing new COVID-19 strains with humans.

Game inspired by the Danish government's plan to cull the entire mink population of Denmark in order to contain the spread of SARS-CoV-2. 

See links to inspiration at the bottom of this readme.

### How to build

Instructions on how to build the game from source. 

This project uses Git submodules, so when cloning use `--recursive` to get the Kha submodule

#### Install NodeJS

https://nodejs.org/en/

#### Install Haxe

https://haxe.org/download/

#### Clone this repository

`git clone https://github.com/timothyr/minks-got-covid.git --recursive`

#### Build and run

```
node Kha/make html5     
node Kha/make --server
```
Navigate to http://localhost:8080 to play the game

### VSCode recommended Extensions

#### Haxe Extension Pack

https://marketplace.visualstudio.com/items?itemName=vshaxe.haxe-extension-pack

#### Kha

https://marketplace.visualstudio.com/items?itemName=kodetech.kha

#### Debugger for Electron

https://marketplace.visualstudio.com/items?itemName=kodetech.electron-debug

### Inspiration
World Health Organization: SARS-CoV-2 mink-associated variant strain – Denmark.  
https://www.who.int/csr/don/06-november-2020-mink-associated-sars-cov2-denmark/en/

BBC: Coronavirus: Denmark shaken by cull of millions of mink.  
https://www.bbc.com/news/world-europe-54890229
