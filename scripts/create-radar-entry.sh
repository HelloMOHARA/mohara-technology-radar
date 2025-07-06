#!/bin/bash

# Script to create a new tech radar entry

# Get current date in YYYY-MM-DD format
CURRENT_DATE=$(date +%Y-%m-%d)
RADAR_DIR="data/radar/$CURRENT_DATE"

# Check if directory exists, if not create it
if [ ! -d "$RADAR_DIR" ]; then
  mkdir -p "$RADAR_DIR"
  echo "Created directory $RADAR_DIR"
fi

# Prompt for technology name
read -p "Enter technology/tool name (for file naming, use lowercase with hyphens): " TECH_NAME
FILE_NAME="$RADAR_DIR/$TECH_NAME.md"

# Check if file already exists
if [ -f "$FILE_NAME" ]; then
  echo "Error: File $FILE_NAME already exists."
  exit 1
fi

# Prompt for title
read -p "Enter title for the technology/tool: " TITLE

# Prompt for approach
read -p "Enter approach (adopt, hold, assess, trial): " APPROACH

# Placeholder for tags (can be enhanced with AI suggestions)
read -p "Enter tags (comma-separated): " TAGS

# Optional input for About section
 echo "Enter content for the 'About' section (press Enter to skip):"
 ABOUT_CONTENT=""
 while IFS= read -r line; do
   if [ -z "$line" ]; then
     break
   fi
   ABOUT_CONTENT="$ABOUT_CONTENT$line\n"
 done

# Optional input for Reasoning section
 echo "Enter content for the 'Reasoning' section (press Enter to skip):"
 REASONING_CONTENT=""
 while IFS= read -r line; do
   if [ -z "$line" ]; then
     break
   fi
   REASONING_CONTENT="$REASONING_CONTENT$line\n"
 done

# Create the frontmatter and content
cat > "$FILE_NAME" << EOF
---
title: $TITLE
date: $CURRENT_DATE
tags: [$TAGS]
approach: $APPROACH
---

# $TITLE

## About

${ABOUT_CONTENT:-<!-- Add details about the technology/tool here -->}

## Reasoning

${REASONING_CONTENT:-<!-- Add reasoning for the chosen approach here -->}
EOF

echo "Created file $FILE_NAME with frontmatter and optional content."

# Optionally, open the file in an editor for further content input
read -p "Do you want to edit the file now? (y/n): " EDIT_NOW
if [[ "$EDIT_NOW" == "y" || "$EDIT_NOW" == "Y" ]]; then
  # Use the default editor or specify one
  ${EDITOR:-nano} "$FILE_NAME"
fi

echo "Radar entry creation complete. You can further edit $FILE_NAME if needed."
