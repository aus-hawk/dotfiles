# dotfiles

This repo uses [Estragon][estragon] to manage the actual dotfiles, as well as
the packages they depend on. Run `./bootstrap.sh [DISTRO]` and everything should
work from there, installing all the packages and deploying the dotfiles, or
telling you what's wrong if it can't do that.

## Further configuration

While it tries to go as far as possible to set up everything at once, there are
some things that need to be set up manually. Namely, the configurations based on
things like hardware and randomly generated names.

### Firefox

Firefox will not be deployed immediately, although it will still be installed.
To deploy it, you need to run `estragon envvar firefox_profile=VALUE` where
value is the name of the Firefox profile folder itself (not the paths). The way
to find that can be found in the [Mozilla docs][firefox-profile], or educated
guessing from the Firefox rules in `estragon.yaml`.

### Polybar

Polybar needs to know the name of the battery and adapter local to the system.
Since it is able to read environment variables, the polybar config uses the
`polybar_battery` and `polybar_adapter` environment variables. When polybar is
launched by bspwm, it uses the Estragon-local values of those variables, which
are set with `estragon envvar polybar_battery=BATTERY polybar_adapter=ADAPTER`.
The bspwm config that calls polybar assumes that the Estragon directory to read
is `~/dotfiles`.

[estragon]: https://github.com/aus-hawk/estragon
[firefox-profile]: https://support.mozilla.org/en-US/kb/profiles-where-firefox-stores-user-data#w_how-do-i-find-my-profile
