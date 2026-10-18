.PHONY: update clean
.DEFAULT_GOAL := update

host = lexodar
#host = azeroth

update:
	sudo nixos-rebuild switch --impure --flake .#$(host)

clean:
	sudo nix-collect-garbage --delete-older-than 1d
