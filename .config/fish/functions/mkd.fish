# Defined in /home/gavinr/.config/fish/functions/mkdir.fish @ line 1
function mkd
	mkdir -p $argv; and cd $argv
end
