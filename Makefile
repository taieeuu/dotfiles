# Path to baseline file that suppresses historical leaks
BASELINE := gitleaks.baseline

# Executable; override if you have gitleaks elsewhere, e.g. `make GITLEAKS=/path/to/gitleaks gitleaks`
GITLEAKS ?= gitleaks

.PHONY: gitleaks
# Scan the repository for new secrets. Fails (non-zero exit status) if any leak
# that is *not* in $(BASELINE) is detected.
gitleaks:
	$(GITLEAKS) detect --source . --baseline-path $(BASELINE) --redact

.PHONY: update_brewfile
update_brewfile:
	brew bundle dump --force --file ./Brewfile

install-macos:
	./install_dotfiles_macos.sh
