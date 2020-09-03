This is the Rails Back end for my online games platform, [Black Horse Games](https://black-horse-games.netlify.app/)

## Concept

Black Horse Games is a multiplayer games platform where users can play games with friends over the web. It has in-game and lobby chat and 2 different game types (tic-tac-toe and connect four). It's responsively styled to display well on desktops, mobiles and tablets.

[Demo link](https://www.youtube.com/watch?v=RVxXg_gi2ts&feature=youtu.be)

[React Front End Link](https://github.com/jsymondst/MOD05-Project-Frontend)

## Overall Structure

The app has 3 models:

-   Games, which handle the game listings
-   Messages, which are linked to a game and are used for chat
-   Turns, which are linked to games and are used to communicate game actions between clients.

## Connections

The app uses Rails' Actioncable for websocket connections. This allows real-time updates of the lobby, game turns and chat, and through the subscribe / unsubscribe methods the server can keep track of how many clients are connected to the main server or to individual games.
