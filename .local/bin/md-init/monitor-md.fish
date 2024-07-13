#!/usr/bin/env fish

# Directory to place symlinks
set TARGET_DIR ~/Documents/notes/markdowns

# Parse arguments
for arg in $argv
    switch $arg
        case --stop
            # Stop the script by killing the background process
            if test -n "$pid"
                echo "Stopping inotifywait process..."
                kill $pid
            else
                echo "No inotifywait process is running."
            end
            exit 0
        case --dir=*
            # Set the target directory based on the argument value
            set TARGET_DIR (string replace -- $arg --dir= "")
        case *
            echo "Invalid argument: $arg"
            exit 1
    end
end

# Create the target directory if it doesn't exist
mkdir -p $TARGET_DIR

# Function to cleanup background process
function cleanup
    if test -n "$pid"
        echo "Stopping inotifywait process..."
        kill $pid
    end
end

# Register the cleanup function to be called on script exit
trap cleanup EXIT

# Monitor the current directory for new .md files in the background
inotifywait -m -e create --format '%w%f' . | while read NEWFILE
    # Check if the new file has a .md extension
    if test (string match -r '.*\.md$' -- $NEWFILE)
        # Create a symlink in the target directory
        ln -s (realpath $NEWFILE) $TARGET_DIR/(basename $NEWFILE)
        echo "Created symlink for $NEWFILE in $TARGET_DIR"
    end
end &

# Store the process ID of the background process
set pid $last_pid

# Wait for the background process to finish
wait $pid
