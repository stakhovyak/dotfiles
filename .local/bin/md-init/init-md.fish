#!/usr/bin/env fish

# Path to the main script
set SCRIPT_PATH /usr/local/bin/monitor-md.fish

# Copy the main script to the current directory
cp $SCRIPT_PATH ./monitor-md.fish

# Make the copied script executable
chmod +x ./monitor-md.fish

echo "Script has been placed in (realpath ./monitor-md.fish) and made executable."

# Run the shit in background
./monitor-md.fish &
