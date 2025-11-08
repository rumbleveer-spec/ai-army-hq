#!/bin/bash

# AI Army HQ - Auto Deploy Script

echo "🔄 Starting deployment..."

# Pull latest changes
echo "📥 Pulling latest code..."
git pull origin main

# Install/update dependencies
echo "📦 Updating dependencies..."
npm install

# Restart PM2 process
echo "🔄 Restarting application..."
pm2 restart ai-army-hq

# Show status
pm2 status

echo "✅ Deployment complete!"