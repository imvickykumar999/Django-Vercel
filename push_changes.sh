#!/bin/bash

# Set up variables
BRANCH="main"  # Change this if you're using a different branch
MESSAGE=${1:-"Update project"}  # Default commit message if none is provided

# Stage all changes
echo "Staging changes..."
git add .

# Commit changes
echo "Committing changes..."
git commit -m "$MESSAGE"

# Push to the remote branch
echo "Pushing to remote branch $BRANCH..."
git push origin $BRANCH

echo "Changes pushed successfully!"
