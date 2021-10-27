# dotfiles
## Installation
You need GNU Stow to actually place everything where it needs to be. Just
install it on your system and run `stow <CONFIG>` to place `CONFIG`'s files
where they need to be. For example, `stow emacs` would place the emacs config
in the proper place.

If you want everything to be placed in its proper place, just `stow *`.

## Adding Configs
`cd` into the `dotfiles` directory and `mkdir` a folder. Inside that folder,
create folders and files in the exact structure of the home directory. For
example, if I wanted to create an Emacs directory, I would:

```sh
cd ~/dotfiles # or wherever the dotfile location is
mkdir emacs
cd emacs
mkdir .emacs.d
cd .emacs.d
touch init.el settings.el
```

Once this is done, `cd` back to the `dotfiles` directory and run:

```
stow --adopt -nvt ~ <FOLDER>
```

Folder here is replaced with the folder that represents `$HOME`. In our Emacs
example, that would be `emacs`.

Once this command is run, it'll show what the result of the command *would* be.
To actually run it, remove the `n` from `-nvt` once you know that the command
does what you actually want it to.

If for some reason a file isn't showing up, that's likely because it is
included in Stow's default ignore. To counteract this, simply create an empty
file called `.stow-local-ignore` in the directory that represents `$HOME`
which, again, would be `emacs` in our example.

Adding files to an already existing set of configs works the exact same,
without the creating new directory part.
