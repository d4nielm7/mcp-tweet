#!/bin/bash
set -e

echo "🚀 Railway custom build script starting..."

# Install Node.js dependencies
echo "📦 Installing frontend dependencies..."
cd frontend
npm install

# Build frontend
echo "🔨 Building frontend..."
npm run build

# Go back to root
cd ..

# Install Python dependencies
echo "📦 Installing Python dependencies..."
pip install -r requirements.txt

echo "✅ Custom build completed successfully!"
