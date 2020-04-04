# blacklist
Bash scripts to install blacklist for technicolor routers (DGA4132)

### Credits to https://www.ilpuntotecnico.com/forum/index.php/topic,78288.0.html

## Warnings:
  - Tested only on DGA4132 router with [unlocked GUI](https://github.com/Ansuel/tch-nginx-gui)
  - Config tested for Tim only, other providers may need some tweaks, especially if USERNAME != URI
  - sip_chan config works, but its install process is untested
  - bash is required for check_score script
  
## How to install:
  ```bash
  chmod u+x blacklist install uninstall
  ./blacklist install pjsip
  ```
## Usage:

  #### Available commands:
  ```bash
  blacklist -h
  ```
  #### Block a number or a file with multiple numbers:
  ```bash
  blacklist block <number|file>
```
## How it works:
  Incoming callers are first checked in the internal database:
  - callers in the blacklist are rejected.
  - callers in the whitelist pass without further checks.
  - callers not in the database are queried to tellows; if reported as spammer, 
  the call is rejected and the number is automatically added to the blacklist.

### Notes
 When adding numbers, include the international prefix, or it won't probably work.
