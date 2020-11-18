Minks Got Covid
========

Play here: https://timothyr.github.io/minks-got-covid/

Save the Mink from slaughter by sharing new COVID-19 strains with humans.

Game inspired by the Danish government's plan to cull the entire mink population of Denmark in order to contain the spread of SARS-CoV-2. 

See links to inspiration at the bottom of this readme.

How to build
-------

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

Inspiration
-------

World Health Organization: SARS-CoV-2 mink-associated variant strain – Denmark.  
https://www.who.int/csr/don/06-november-2020-mink-associated-sars-cov2-denmark/en/

BBC: Coronavirus: Denmark shaken by cull of millions of mink.  
https://www.bbc.com/news/world-europe-54890229

License
-------
Based off of [KhaShmup](https://github.com/jamiltron/KhaShmup) by Justin Hamilton

Copyright (c) 2015, Justin Hamilton 
All rights reserved. 

Redistribution and use in source and binary forms, with or without 
modification, are permitted provided that the following conditions are met: 

 * Redistributions of source code must retain the above copyright notice, 
   this list of conditions and the following disclaimer. 
 * Redistributions in binary form must reproduce the above copyright 
   notice, this list of conditions and the following disclaimer in the 
   documentation and/or other materials provided with the distribution. 
 * Neither the name of Doom Crow LLC nor the names of its contributors may 
   be used to endorse or promote products derived from this software 
   without specific prior written permission. 

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE 
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
POSSIBILITY OF SUCH DAMAGE. 
