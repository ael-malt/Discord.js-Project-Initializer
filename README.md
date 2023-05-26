# Discord.js-Project-Initializer
This project aims to create a folder with everything you need to start on your Discord bot idea, you just need to enter your TOKEN in the .env file and the bot is ready to go

## Installation & Usage
1. Download/Clone this repo
```
	git clone https://github.com/thenono1/Discord.js-Project-Initializer)
```
2. `cd` into the root directory and run `./initialize-project.sh <Project Name>`
```
	cd Discord.js-Project-Initializer
	./initialize-project.sh <Project Name>
```
3. Once the script finishes running, enter the folder you just created using `cd <Project Name>`
```
	cd <Project Name>
```
4. Open the project with your favourite text editor, and add your bot token in the .env file following the `=` in `DISCORD TOKEN=`
```
	DISCORD_TOKEN=<YOUR DISCORD TOKEN>
```
5. (Optional) If you want to connect the bot to a database, enter your mongo URI in the .env file following the `=` in `MONGO_URI=`
```
	MONGO_URI=<YOUR MONGO URI>
```
5. Finally, you can run your bot running `npm run server`, which will make it so it restarts everytime you save changes, or you can use `node .` to just run it.
```
	npm run server
	node .
```
