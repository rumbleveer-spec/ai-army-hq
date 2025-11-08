#!/bin/bash

# AI Army HQ - Hostinger VPS Setup Script

echo "🚀 Starting AI Army HQ VPS Setup..."

# Update system
echo "📦 Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install Node.js 18.x echo "📦 Installing Node.js..."
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -z nodejs

# Install Nginx
echo "📦 Installing Nginx..."
sudo apt install -y nginx

# Install PM2 globally
echo "📦 Installing PM2..."
sudo npm install -g pm2

# Create logs directory
echo "📁 Creating logs directory..."
mkdir -p logs

# Install project dependencies
echo "📦 Installing project dependencies..."
npm install

# Copy environment file
echo "📝 Setting up environment variables..."
if [ ! -f .env ]; then
    cp .env.example .env
    echo "⚠️  IMPORTANT: Edit .env file with your actual values!"
fi

# Setup firewall
echo "🔒 Configuring firewall..."
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw --force enable

# Start application with PM2
echo "🚀 Starting application..."
npm run pm2:start
pm2 save
pm2 startup

echo ""
echo "✅ Setup complete!"
echo ""
echo "👋‍ Next steps:"
echo "1. Edit .env file: nano .env"
echo "2. Check application: pm2 status"
echo "3. View logs: pm2 logs ai-army-hq"
echo ""
echo "🌐 Your API should be running at: http://your-vps-ip:3000"