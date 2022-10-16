# Tmux on mac M1 need more setup
reference : https://stackoverflow.com/a/72596670/2652524

```shell
brew install ncurses
$(brew --prefix)/opt/ncurses/bin/infocmp tmux-256color > ~/tmux-256color.info
tic -xe tmux-256color ~/tmux-256color.info
```
