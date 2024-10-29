```bash
#!/bin/bash

# Define the commit message template
MSG_TEMPLATE="Automated commit: %s (%s) %s"

# Check if there are any modified files
if [ $(git diff --name-only --staged) ]; then
  # Get the list of modified files
  ModifiedFiles=$(git diff --name-only --staged)

  # Loop through each modified file
  for File in $ModifiedFiles; do
    # Get the file extension
    Extension=${File##*.}

    # Determine the type of change (addition, modification, or deletion)
    if [ -f "$File" ]; then
      ChangeType="Modified"
    elif [ -d "$File" ]; then
      ChangeType="Added directory"
    else
      ChangeType="Deleted"
    fi

    # Construct the commit message
    MSG="${MSG_TEMPLATE} $ChangeType $File"

    # Print the commit message
    echo "$MSG"

    # Exit the script
    exit 0
fi

if [ $(git diff --name-only --unstaged) ]; then
  # Get the list of unmodified files
  UnmodifiedFiles=$(git diff --name-only --unstaged)

  # Loop through each unmodified file
  for File in $UnmodifiedFiles; do
    # Get the file extension
    Extension=${File##*.}

    # Determine the type of change (addition, modification, or deletion)
    if [ -f "$File" ]; then
      ChangeType="Modified"
    elif [ -d "$File" ]; then
      ChangeType="Added directory"
    else
      ChangeType="Deleted"
    fi

    # Construct the commit message
    MSG="${MSG_TEMPLATE} $ChangeType $File"

    # Print the commit message
    echo "$MSG"

    # Exit the script
    exit 0
fi

# If no files were modified, print a message
echo "No files modified for commit"

# Exit the script
exit 0
```
