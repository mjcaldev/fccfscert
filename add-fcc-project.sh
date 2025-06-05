#!/bin/bash

# -----------------------
# add-fcc-project.sh
# -----------------------

# Exit on error
set -e

if [ -z "$1" ]; then
  echo "❌ Please provide a project name."
  echo "Usage: ./add-fcc-project.sh <project-name>"
  exit 1
fi

PROJECT_NAME=$1
GITHUB_USERNAME="mjcaldev"  # Change if needed

echo "🚀 Creating new FCC project: $PROJECT_NAME"

# 1. Create project directory and files
mkdir "$PROJECT_NAME"
cd "$PROJECT_NAME"
touch index.html styles.css

# Optional: Add boilerplate to index.html
cat <<EOL > index.html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>${PROJECT_NAME^}</title>
    <link rel="stylesheet" href="styles.css" />
  </head>
  <body>
    <h1>${PROJECT_NAME^}</h1>
    <p>Welcome to the project.</p>
  </body>
</html>
EOL

# 2. Initialize git and commit
git init
git add .
git commit -m "Initial commit for $PROJECT_NAME"

# 3. Create GitHub repo and push
gh repo create "$GITHUB_USERNAME/$PROJECT_NAME" --public --source=. --push

# 4. Return to parent and add as submodule
cd ..
git submodule add "https://github.com/$GITHUB_USERNAME/$PROJECT_NAME.git" "$PROJECT_NAME"

# 5. Commit submodule reference
git add .gitmodules "$PROJECT_NAME"
git commit -m "Add $PROJECT_NAME as submodule"
git push

echo "✅ $PROJECT_NAME setup complete!"
