# SIMPLE SCRIPTS
Simple ruby scripts to automate daily tasks.

## Resize script
A very simple script based on [calebwoods gist](https://gist.github.com/calebwoods/714731713935bd2b3625).
Arguments: directory_to_resize, max_width, quality_of_resized_pictures
```zsh
	$ ./resize images/ 800 60
```

## Generate SSH Key
Ridiculous simple script which generate a SSH key and copy it to clipboard using xclip.
Works only on Debian based Linux Distributions.
Arguments: email
```zsh
	$ ./gen_ssh_key.sh email@example.com
```
