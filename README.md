<p align="center"><a href="https://bearsampp.com/contribute" target="_blank"><img width="300" src="img/artwork/Bearsampp-with-text-stroked.svg"></a></p>

# .settings

These are the settings that should be included in every repo & editor.
This is eqv to https://docs.joomla.org/Joomla_CodeSniffer

** How to clone all repos in the organization at once.

- first download and install [Git-cli](https://cli.github.com/)
- reboot
- open console where you want the repo's to be.  For me, it was **_"E:\Development\MY_PROJECTS\bearsampp-development"_**
- type `gh extension install matt-bartel/gh-clone-org`
- after that's installed type `gh clone-org -y Bearsampp`

That's all there is too it.  [Full instructions here](https://github.com/matt-bartel/gh-clone-org)

Contains an action, list-repos.yml, that will automatically create a list of ALL repo's and put it into "current-repos.md".
It specifically removes the '.settings' & 'bearsampp.com' repo as those are static and will always be preset.
