#!/bin/sh
#  Check if a <project name> is given
if [ -z "$1" ]
then
	echo '\e[31mError\n\e[33mTry using "./init-project.sh <project name>"'
	exit 1
fi
#  Check if a folder with that name already exists
if [ -d "$1" ]
then
	echo "\e[31mError\n\e[33mA folder named <$1> already exists"
	exit 1
fi
#  1 Create folder with the <project name>
echo "\e[32m1 - Creating <$1> folder\e[39m" 
mkdir "$1"

#  2 Enter the folder
echo "\e[32m2 - Entering <$1> folder\e[39m" 
cd "$1"

#  3 Initialize npm project
echo "\e[32m3 - Initializing npm project\e[39m" 
npm init -y > /dev/null

#  4 Install dependencies
echo "\e[32m4 - Installing dependencies\e[39m" 
npm install discord.js wokcommands nodemon mongoose dotenv

#  5 Edit package.json
echo "\e[32m5 - Editing package.json\e[39m" 
sed -i '7s/$/,\n    "start": "node index.js",\n    "server": "nodemon index.js"/' package.json

#  6 Create necessary folders
echo "\e[32m6 - Creating necessary folders\e[39m" 
mkdir commands features schemas

#  7 Create necessary files
echo "\e[32m7 - Creating necessary files\e[39m" 
touch .env .gitignore index.js commands/command-example.js features/feature-example.js schemas/schema-example.js

#  8 Write to .env
echo "\e[32m8 - Writing to .env\e[39m" 
echo "DISCORD_TOKEN=\nMONGO_URI=" > .env

# 9 Write to .gitignore
echo "\e[32m9 - Writing to .gitignore\e[39m"
echo "node_modules\n.env" > .gitignore

#  10 Write to index.js
echo "\e[32m10 - Writing to index.js\e[39m" 
echo 'const { Client, IntentsBitField, Partials } = require("discord.js");
const WOK = require("wokcommands");
const path = require("path");
require("dotenv/config");

const dotenv = require("dotenv");
dotenv.config();

const client = new Client({
	intents: [
	IntentsBitField.Flags.Guilds,
	IntentsBitField.Flags.GuildMessages,
	IntentsBitField.Flags.DirectMessages,
	IntentsBitField.Flags.MessageContent,
	],
	partials: [Partials.User, Partials.Channel, Partials.GuildMember, Partials.Message, Partials.Reaction, Partials.GuildScheduledEvent, Partials.ThreadMember],
});

client.on("ready", () => {
	console.log("'$1' is Ready!");
	client.user.setActivity("<STATUS>", { type: "PLAYING" });
	new WOK({
		client,
		commandsDir: path.join(__dirname, "commands"),
		featuresDir: path.join(__dirname, "features"),
		testServers: [""],
		mongoUri: process.env.MONGO_URI,
	});
});

client.login(process.env.DISCORD_TOKEN);' > index.js

#11 Write to command-example.js
echo "\e[32m11 - Writing to command-example.js\e[39m"
echo 'const Discord = require("discord.js");
const { CommandType } = require("wokcommands");

module.exports = {
	callback: ({client, instance, message, interaction, args, text, guild, member, user, channel, cancelCooldown, updateCooldown,}) => {
		// Command
	},
	// LEGACY
	// SLASH
	// BOTH
	type: CommandType.BOTH,
	description: "Add your description here",
	aliases: [],
	testOnly: false,
	guildOnly: false,
	ownerOnly: false,
	permissions: [],
	// "ephemeral" 
	// true\
	// false\
	deferReply: false,
	minArgs: 0,
	maxArgs: -1,
	correctSyntax: "Correct syntax: {PREFIX}{COMMAND} {ARGS}",
	expectedArgs: "<num1> <num2>",	
	options: [],
	reply: true,
	delete: false
}' > commands/command-example.js

#12 Write to feature-example.js
echo "\e[32m12 - Writing to feature-example.js\e[39m"
echo 'const Discord = require("discord.js");

module.exports = (instance, client) => {

};' > features/feature-example.js

# 13 Write to schema-example.js
echo "\e[32m13 - Writing to feature-example.js\e[39m"
echo 'const mongoose = require("mongoose");

const SE_Schema = new mongoose.Schema({
	Title: String,
	Description: String,
	Link: String,
	Picture: String,
});
module.exports = mongoose.model("Schema Example", SE_Schema);
module.exports.config = {
	dbName: "schema-example",
	displayName: "Schema Example",
};' > schemas/schema-example.js

