#!/bin/bash
set -e

echo "🚀 Starting custom build process..."

echo "📦 Installing frontend dependencies..."
cd frontend
npm install

echo "🔨 Building frontend..."
npm run build

echo "📦 Installing Python dependencies..."
cd ..
pip install -r requirements.txt

echo "✅ Build completed successfully!"
