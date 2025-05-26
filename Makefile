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
# Dump the current list of installed Homebrew packages into Brewfile,
# overwriting the existing file.
update_brewfile:
	brew bundle dump --force --file ./Brewfile
