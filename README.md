# rust-single-player
Classic rust game but in single player, with modifications that make this mode heaps of fun!


Requirements:
Rust, owned and downloaded through steam.
Windows 10
Connection to the internet

How to use:
Download the "Rust Single Player.bat" from this GitHub page. Save it in a folder somewhere (I recommend in Documents, but not Desktop as Desktop has limited space).
Double click the file to run it.

How it works:
Firstly, it downloads and extracts SteamCMD (if not already), this is used to download and run the local rust server.
Updates SteamCMD (if not up to date) and logins.
From SteamCMD it downloads/updates the local rust server (unless already downloaded and up to date).
Then it launches 2 programs: The local rust server (with single player settings), Rust game (via steam), and then waits for the server to load.
When the server is loaded (checking if a log file exists), it switches to the Rust game, presses f1 to open the console, then typing "client.connect localhost:28015", enter, and f1 again to close the console.

