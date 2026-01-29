#!/bin/bash

# Simple deployment script for various platforms

echo "Web3 Glossary Deployment Script"
echo "==============================="
echo ""
echo "Choose your deployment platform:"
echo "1. Surge.sh (Quick and easy, no account needed)"
echo "2. Netlify (Via CLI)"
echo "3. Vercel (Via CLI)"
echo "4. GitHub Pages (Instructions only)"
echo ""
read -p "Enter your choice (1-4): " choice

case $choice in
    1)
        echo "Deploying to Surge.sh..."
        if ! command -v surge &> /dev/null; then
            echo "Surge not found. Install it with: npm install -g surge"
            exit 1
        fi
        surge .
        ;;
    2)
        echo "Deploying to Netlify..."
        if ! command -v netlify &> /dev/null; then
            echo "Netlify CLI not found. Install it with: npm install -g netlify-cli"
            exit 1
        fi
        netlify deploy --prod --dir=.
        ;;
    3)
        echo "Deploying to Vercel..."
        if ! command -v vercel &> /dev/null; then
            echo "Vercel CLI not found. Install it with: npm install -g vercel"
            exit 1
        fi
        vercel --prod
        ;;
    4)
        echo "To deploy to GitHub Pages:"
        echo "1. Push this code to a GitHub repository"
        echo "2. Go to Settings > Pages in your repository"
        echo "3. Under 'Source', select your branch (usually 'main' or 'master')"
        echo "4. Select '/ (root)' as the folder"
        echo "5. Click Save"
        echo "6. Your site will be available at: https://[username].github.io/[repository-name]"
        ;;
    *)
        echo "Invalid choice. Please run the script again."
        exit 1
        ;;
esac

echo ""
echo "Deployment process completed!"