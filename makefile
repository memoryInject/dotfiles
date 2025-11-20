# Makefile

# Change this to the repo you want to clone
REPO_URL = https://github.com/username/reponame.git
# Extract repo name from URL
REPO_NAME = $(notdir $(basename $(REPO_URL)))
# Destination folder
DEST_DIR = $(HOME)/.local/share/$(REPO_NAME)
# Path to the main Python script
MAIN_SCRIPT = $(DEST_DIR)/src/main.py

.PHONY: init run update

# Clone the repository into ~/python/reponame
init:
	@echo "Cloning $(REPO_URL) into $(DEST_DIR)..."
	@mkdir -p $(HOME)/python
	@if [ ! -d "$(DEST_DIR)" ]; then \
		git clone $(REPO_URL) $(DEST_DIR); \
	else \
		echo "Repo already exists, skipping clone."; \
	fi
	@echo "Init complete!"

# Pull latest changes if the repo exists
update:
	@if [ -d "$(DEST_DIR)" ]; then \
		echo "Updating repo $(REPO_NAME)..."; \
		cd $(DEST_DIR) && git pull; \
	else \
		echo "Repo does not exist, cannot update."; \
	fi

# Run the repo: init/pull then run Python main.py
run: init update
	@echo "Running Python script: $(MAIN_SCRIPT)"
	@python3 $(MAIN_SCRIPT)
