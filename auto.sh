#!/bin/bash

# ---------- CREATE DAY FOLDER ----------
if [ "$1" = "-f" ]; then
    echo "Enter Day Number:"
    read day

    # Error handling: Check if input is empty
    if [ -z "$day" ]; then
        echo "Error: Day number cannot be empty."
        exit 1
    fi

    folder="Day_$day"
    mkdir -p "$folder"

    touch "$folder/script.js"
    touch "$folder/style.css"

    cat <<EOF > "$folder/index.html"
<!doctype html>
<html>
  <head>
    <title>Css Challenge Day $day</title>
    <link rel="stylesheet" href="style.css" />
  </head>
  <body>
    <script src="script.js"></script>
  </body>
</html>
EOF

    echo "Created $folder with files."

# ---------- GIT PUSH ----------
elif [ "$1" = "-g" ]; then
    # Automatically find the latest Day_* folder number
    # It lists folders matching 'Day_*', extracts the numbers, sorts them numerically, and takes the highest one.
    latest_day=$(ls -d Day_* 2>/dev/null | sed 's/Day_//' | sort -n | tail -n 1)

    # Fallback if no Day_X folder is found
    if [ -z "$latest_day" ]; then
        echo "No Day_* folders found. Enter commit message manually:"
        read msg
    else
        msg="Day#$latest_day"
        echo "Automated commit message: $msg"
    fi

    # Error handling: Check if message is empty (in case fallback was triggered)
    if [ -z "$msg" ]; then
        echo "Error: Commit message cannot be empty. Push aborted."
        exit 1
    fi

    git add .
    git commit -m "$msg"
    git push origin main

    echo "Changes pushed to GitHub."

# ---------- ERROR HANDLING FOR FLAGS ----------
else
    echo "Usage: ./script.sh [flag]"
    echo "Flags:"
    echo "  -f    Create a new day folder"
    echo "  -g    Push changes to GitHub"
fi