# dotfiles

This repo uses [Estragon][estragon] to manage the actual dotfiles, as well as
the packages they depend on. Run `./bootstrap.sh [DISTRO]` and everything should
work from there, installing all the packages and deploying the dotfiles, or
telling you what's wrong if it can't do that.

The only oddball is Firefox, which will not be deployed immediately (although it
will still be installed). To deploy it, you need to run `estragon env
firefox_profile=VALUE` where value is the name of the Firefox profile folder
itself (not the paths). The way to find that can be found in the [Mozilla
docs][firefox-profile], or educated guessing from the Firefox rules in
`estragon.yaml`.

[estragon]: https://github.com/aus-hawk/estragon
[firefox-profile]: https://support.mozilla.org/en-US/kb/profiles-where-firefox-stores-user-data#w_how-do-i-find-my-profile
