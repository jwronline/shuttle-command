# shuttle-command
Use a modified numpad to emulate the input of commands in a space shuttle.

# Set-up
You need an (external) numpad and modify it to look like this image:

![modified numpad](img/numpad.png)

The keypad is modified to show <kbd>+</kbd> as <kbd>HELP</kbd>, <kbd>-</kbd> as <kbd>POS</kbd>, <kbd>*</kbd> as <kbd>OPS</kbd> and <kbd>/</kbd> as <kbd>ITEM</kbd>.

## Downloading the script

Download the [shuttle.sh](img/shuttle.sh) script using your preferred method. For example through git:

```sh
git clone https://github.com/haroenv/shuttle-command.git
cd shuttle-command
ls
```

or if you don't have git, a simple curl should also work:

- [ ] to do: find correct raw.githubusercontent.com address

```sh
curl
```

## Using the modified font

Download the [font](shuttle.otf) and install it (usually: `sudo cp -r ./shuttle.otf /usr/share/fonts/truetype/`) or installing it using the default graphical method.

To make things easy, the first method is also included in a script called `moveFont.sh`, which can ask for your admin password.

and make sure it is used in your terminal (right-click > preferences > font > For Personal Gain (regular)).

This font is modified to show <kbd>+</kbd> as <kbd>HELP</kbd>, <kbd>-</kbd> as <kbd>POS</kbd>, <kbd>*</kbd> as <kbd>OPS</kbd> and <kbd>/</kbd> as <kbd>ITEM</kbd>.

## Using AutoKey

- [ ] to do: write installation-script

Run the `autoKeySetup.sh`-script, which will determine if there is already an install of autoKey, and install the correct script to change the numpad behaviour. Beware, this will affect every time an external numpad is used on this computer, unless that script of autoKey is manually disabled. [More info about downloading autoKey](https://code.google.com/p/autokey/wiki/InstallingAutoKey).

# Usage

Open your terminal, `cd` into the correct directory.

It could be possible that the script doesn't have the correct permissions. You can check this by doing `ls -a shuttle.sh` in the correct directory. The output should look like this: `-rwxr-xr-x 1 user  staff   6.7K Mar 18 12:06 shuttle.sh*`, important is that you at least see the first `x`, if you don't you can change the permissions using `chmod 755 shuttle.sh`.

## Running
open the script in terminal using `./shuttle.sh`, enter the language, the correct position and then the correct operation.

Then you can enter the item-code, which will display whether it was correct or not.

To exit from a position, enter operation 999.


## Operating

- [ ] to do: remake the scripts to make use of `shuttle.sh`
- [ ] to do: make `shuttle.sh` in such a way that it matches the script

The times at which certain codes have to be entered are written in the space shuttle script. This can be found at [scripts/](scripts/)

# Demo
## Using AutoKey
This is also the preferred method for a full keyboard without alterations. AutoKey will convert the keys on the keypad to the corresponding codes when correctly set up.

![demo](img/demo-full.png)

## Using the modified font
This method is optimised for input by numpad, but not great when you want to still do other things in the same window.

![demo](img/demo-short.png)

# License
<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons Licence" style="border-width:0" src="https://i.creativecommons.org/l/by-nc/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/Text" property="dct:title" rel="dct:type">shuttle-command</span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>. No warranty whatsoever.

Made for [JWR v.z.w](http://jwronline.be) by Haroen Viaene


Font is based on ["For Personal Gain - NonProfit"](https://medium.com/portfolio-process/why-im-giving-my-typeface-away-for-free-466919f02d96)
