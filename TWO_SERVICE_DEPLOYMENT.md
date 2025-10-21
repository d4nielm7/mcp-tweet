# Two-Service Railway Deployment Guide

## Overview
Since Railway only runs Python and ignores frontend builds, we'll create two separate services:
1. **Backend Service** - Python MCP Server
2. **Frontend Service** - React App

## Service 1: Backend (Python MCP Server)

### Create Backend Service:
1. **Go to Railway dashboard**
2. **Click "New" → "GitHub Repo"**
3. **Select your repository**
4. **Set Root Directory:** `beautiful_gradient_mcp`
5. **Name:** `mcp-tweet-backend`

### Backend Environment Variables:
```
STYTCH_PROJECT_ID=your_stytch_project_id
STYTCH_PUBLIC_TOKEN=your_stytch_public_token
STYTCH_CLIENT_ID=your_stytch_client_id
DATABASE_URL=<from PostgreSQL service>
MCP_SERVER_URL=https://mcp-tweet-backend-production.up.railway.app
USE_HTTPS=false
RELOAD=false
```

### Backend Configuration:
- **Build Command:** `pip install -r requirements.txt`
- **Start Command:** `python main.py`
- **Health Check:** `/.well-known/oauth-protected-resource`

## Service 2: Frontend (React App)

### Create Frontend Service:
1. **Click "New" → "GitHub Repo"**
2. **Select the same repository**
3. **Set Root Directory:** `beautiful_gradient_mcp/frontend`
4. **Name:** `mcp-tweet-frontend`

### Frontend Environment Variables:
```
VITE_STYTCH_PUBLIC_TOKEN=your_stytch_public_token
VITE_API_URL=https://mcp-tweet-backend-production.up.railway.app
```

### Frontend Configuration:
- **Build Command:** `npm install && npm run build`
- **Start Command:** `npm run preview` (or serve static files)

## Database Service:
1. **Add PostgreSQL service** to your project
2. **Connect it to the backend service** using Railway's variable references

## Connecting Services:

### Step 1: Get Backend URL
After backend deploys, copy the URL: `https://mcp-tweet-backend-production.up.railway.app`

### Step 2: Update Frontend Environment
Set `VITE_API_URL` in frontend service to your backend URL

### Step 3: Update Stytch Redirect URLs
In Stytch dashboard, update redirect URLs to use your frontend URL:
- `https://mcp-tweet-frontend-production.up.railway.app/login`

## Benefits:
✅ **Backend builds with Python** (works perfectly)  
✅ **Frontend builds with Node.js** (works perfectly)  
✅ **Each service uses appropriate build process**  
✅ **Clear separation of concerns**  
✅ **Easy to scale independently**

## Testing:
1. **Backend:** `https://mcp-tweet-backend-production.up.railway.app/.well-known/oauth-protected-resource`
2. **Frontend:** `https://mcp-tweet-frontend-production.up.railway.app`
3. **MCP Endpoint:** `https://mcp-tweet-backend-production.up.railway.app/mcp`

This approach will definitely work because each service uses its native build process! 🎯
