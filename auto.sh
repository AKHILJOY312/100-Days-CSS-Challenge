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
elif [ "$1" = "-git" ]; then
    echo "Enter commit message:"
    read msg

    # Error handling: Check if message is empty
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
    echo "  -git  Push changes to GitHub"
fi