# If you come from bash you might have to change your $PATH.
export PATH=$PATH:/usr/local/i386elfgcc/bin

# Path to your oh-my-zsh installation.
export ZSH="/home/babkock/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="wedisagree"
ZSH_THEME="wedisagree"

ZSH_THEME_RANDOM_CANDIDATES=(
	"gentoo"
	"wedisagree"
	"eastwood"

)

LS_COLORS=$LS_COLORS'*.txt=1;93:*.log=1;93:*.php=1;31:*.js=1;32:*.bin=1;32:*.asm=1;31:*.json=1;93:*.html=0;35;40:*.xml=0;35:*.yaml=0;35:*.shtml=0;35:*.mkv=1;31:*.conf=1;33:*.ini=1;33:*.sh=1;32:*.lua=1;32:*.css=0;36:*.scss=0;36:*.less=0;36:*.c=1;93:*.h=1;31:*.cpp=1;32:*.rs=1;31:*.rb=1;31:*.py=1;31:*.pl=1;32:*.md=1;93:*.rtf=1;93:*.o=0;33:*.txt=1;93:*.log=1;93:*.php=1;31:*.js=1;32:*.bin=1;32:*.asm=1;31:*.json=1;93:*.html=0;35:*.xml=0;35:*.yaml=0;35:*.torrent=0;35:*.toml=0;35:*.yml=0;35:*.shtml=0;35:*.mkv=1;31:*.conf=1;33:*.ini=1;33:*.sh=1;32:*.lua=1;32:*.css=0;36:*.scss=0;36:*.less=0;36:*.vue=0;36:*.img=1;91:*.iso=1;93:*.c=1;93:*.h=1;31:*.cpp=1;32:*.rs=1;31:*.rb=1;31:*.py=1;31:*.pl=1;32:*.md=1;93:*.rtf=1;93;40:*.o=0;33:*.rlib=0;33:*.d=0;33:*.so=0;33:*.lock=1;93'

LSCOLORS=$LS_COLORS

ZLS_COLORS=$ZLS_COLORS'*.yaml=0;35:*.shtml=0;35:*.mkv=1;31:*.conf=1;33:*.ini=1;33:*.sh=1;32:*.lua=1;32:*.css=0;36:*.scss=0;36:*.less=0;36:*.c=1;93:*.h=1;31:*.cpp=1;32:*.rs=1;31:*.rb=1;31:*.py=1;31:*.pl=1;32:*.md=1;93:*.rtf=1;93:*.o=0;33:*.d=0;33:*.rlib=0;33:*.so=0;33:*.lock=1;93:*.txt=1;93:*.log=1;93:*.php=1;31:*.js=1;32:*.bin=1;32:*.asm=1;31:*.json=1;93:*.html=0;35:*.xml=0;35:*.toml=0;35:*.torrent=0;35:*.yml=0;35:*.shtml=0;35:*.mkv=1;31:*.conf=1;33:*.ini=1;33:*.sh=1;32:*.img=1;91:*.iso=1;93:*.lua=1;32:*.css=0;36:*.scss=0;36:*.vue=0;36:*.less=0;36:*.c=1;93:*.h=1;31:*.cpp=1;32:*.rs=1;31:*.rb=1;31:*.py=1;31:*.pl=1;32:*.md=1;93:*.rtf=1;93:*.o=0;33:*.rlib=0;33:*.d=0;33:*.so=0;33:*.lock=1;93'

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(gitfast colored-man-pages zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='vim'
fi

alias poses="sudo chown babkock:babkock "
mkcd() {
	mkdir "$1"
	cd "$1"
}
pisend() {
	scp -i ~/.ssh/laptop2pi "$1" pi@192.168.0.14:~/Downloads
}

xbcompile() {
	if [ -z "$1" ]; then
		printf "Please specify the name of your package\n" > /dev/stderr
		false
	else
		cd ../../..;	
		./xbps-src build -C -f "$1"
		cd $OLDPWD
		true
	fi
}

conf() {
	if [ -z "$1" ]; then
		printf "Specify which program you want to configure\n" > /dev/stderr
		printf "[x | bash | bspwm | sxhkd | polybar | vim | zsh | ncmpcpp | herbstluftwm | i3 ]\n" > /dev/stderr
		printf "[mpv | mpd | ranger | runit | jgmenu | filezilla ]\n" > /dev/stderr
		false
	else
		case "$1" in
			x)
				vim ~/.xinitrc
				printf "Configured X\n"
				;;
			bash)
				vim ~/.bashrc
				printf "Configured Bash\n"
				;;
			bspwm)
				vim ~/.config/bspwm/bspwmrc
				printf "Configured bspwm\n"
				;;
			herbstluftwm)
				vim ~/.config/herbstluftwm/autostart
				printf "Configured Herbstluftwm\n"
				;;
			i3)
				vim ~/.config/i3/config
				printf "Configured i3\n"
				;;
			mpv)
				vim ~/.config/mpv/mpv.conf
				printf "Configured mpv\n"
				;;
			sxhkd)
				vim ~/.config/sxhkd/sxhkdrc
				printf "Configured sxhkd\n"
				;;
			polybar)
				vim ~/.config/polybar/config
				printf "Configured Polybar\n"
				;;
			filezilla)
				vim ~/.config/filezilla/filezilla.xml
				printf "Configured Filezilla\n"
				;;
			jgmenu)
				vim ~/.config/jgmenu/jgmenurc
				printf "Configured jgmenu\n"
				;;
			vim)
				vim ~/.vimrc
				printf "Configured Vim\n"
				;;
			ncmpcpp)
				vim ~/.ncmpcpp/config
				printf "Configured ncmpcpp\n"
				;;
			nbindings)
				vim ~/.ncmpcpp/bindings
				printf "Configured ncmpcpp bindings\n"
				;;
			mpd)
				sudo vim /etc/mpd.conf
				printf "Configured mpd\n"
				;;
			ranger)
				vim ~/.config/ranger/rc.conf
				printf "Configured ranger\n"
				;;
			runit1)
				sudo vim /etc/runit/1
				printf "Configured runit stage 1: Warning, changes will take effect next boot\n"
				;;
			runit2)
				sudo vim /etc/runit/2
				printf "Configured runit stage 2: Warning, changes will take effect next reboot\n"
				;;
			runit3)
				sudo vim /etc/runit/3
				printf "Configured runit stage 3: Warning, changes will take effect next shutdown\n"
				;;
			zsh)
				vim ~/.zshrc
				printf "Configured zsh\n"
				;;
			*)
				printf "Program to configure '%s' not found\n" "$1"
				false
				;;
		esac
	fi
}

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#4f4f53"
alias ..="cd .."
alias a="bat --wrap character -n "
alias c="cd "
alias cat="bat --wrap character -n "
alias e="cargo build --release"
alias k="make"
alias kc="make clean"
# alias q="qemu-system-x86_64 -smp 1 -m size=1200M -hda os-image.bin"
# alias qd="qemu-system-x86_64 -gdb tcp::1234,ipv4 -smp 1 -m size=1200M -S -hda os-image.bin"
alias f="feh"
alias u="cd ~/Music"
alias o="cd ~/Documents"
alias d="cd ~/Downloads"
alias p="cd ~/Pictures"
alias i="cd ~/Videos"
alias m="mpv"
alias n="ncmpcpp"
alias g="git"
alias ga="git add"
alias gr="git rm"
alias grc="git rm --cached"
alias gs="git status"
alias gl="git log"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gcm="git commit -m"
alias gpush="git push origin master"
alias gpull="git pull origin master"
alias v="vim"
alias reboot="sudo reboot"
alias shutdown="sudo shutdown -h now"
alias x="sudo zsh"
alias df="df -h -T"
case "$(tty)" in
	*tty*)
		alias lsl="ls -Fl --group-directories-first --color=auto"
		alias lsa="ls -FA --group-directories-first --color=auto"
		alias lsla="ls -FlA --group-directories-first --color=auto"
		alias ls="ls -F --group-directories-first --color=auto"
		;;
	*pts*)
		alias lst="lsd -F --tree --group-dirs first --date relative --blocks permission,user,size,date,name --depth 4"
		alias lsla="ls -FlA --group-dirs first --date relative --blocks permission,user,size,date,name"
		alias lsl="ls -Fl --group-dirs first --date relative --blocks permission,user,size,date,name"
		alias lsa="lsd -FA --group-dirs first --date relative --blocks permission,user,size,date,name"
		alias ls="lsd -F --group-dirs first --date relative"
		;;
esac
alias b="neofetch --package_managers on --distro_shorthand tiny --uptime_shorthand tiny --gap -1"
alias l="lsd -F --group-dirs first --date relative"
alias s="ssh tababcock@tannerbabcock.com -p 2222"
alias spi="ssh pi@192.168.0.14 -i ~/.ssh/laptop2pi"
alias jcommit="git commit -m '$(date)'; git push"
alias r="ranger"
alias t="transmission-remote-cli"
alias tr="transmission-remote"
alias z="tmux"

