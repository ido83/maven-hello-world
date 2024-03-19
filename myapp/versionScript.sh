#!/bin/bash

pom_path="pom.xml"
file_path="file.txt"

# get the last version from pom.xml file
current_version=$(grep -oPm1 "(?<=<version>)[^<]+" "$pom_path")

increment_version() {
    local version=$1
    IFS='.' read -ra parts <<< "$version"
    local major=${parts[0]}
    local minor=${parts[1]}
    local patch=${parts[2]}
    # update patch number only 
    new_patch=$((patch + 1))
    echo "$major.$minor.$new_patch"
}

# Version incerese
new_version=$(increment_version $current_version)


# Update pom.xml with the new version
sed -i "s/<version>$current_version<\/version>/<version>$new_version<\/version>/" "$pom_path"

# Get the current date in YYYY-MM-DD format
current_date=$(date +%F)

# appended the new version and current date to file.txt
echo "New Version: $new_version" >> "$file_path"
echo "Date: $current_date" >> "$file_path"

# Dipslay the resulting
cat "$file_path"
