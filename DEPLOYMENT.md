# Deployment Guide

## Important: Facebook Credentials Required

This bot requires Facebook account credentials to function stored in the `account.txt` file.

## How to Get Your Facebook Cookies

### Method 1: Using Browser Extension (Easiest)

1. Install a cookie extension in your browser (e.g., "EditThisCookie" or "Cookie-Editor")
2. Go to Facebook.com and login
3. Export cookies as JSON
4. Save as `account.txt` in the project root

### Method 2: Using the Bot's Built-in Tool

1. Run the bot locally first
2. Use the `/getfbstate` command in messenger
3. The bot will send you the cookies
4. Save them to `account.txt`

## Deploying to Render

### Step 1: Prepare Your Credentials

1. Get your Facebook cookies (see above)
2. Create `account.txt` file in your project root with the cookies (see `account.txt.example` for format)
3. Commit the file to your repository

**Important:** Make sure your repository is **PRIVATE** since it will contain your Facebook credentials.

### Step 2: Create Web Service on Render

1. Go to [Render Dashboard](https://dashboard.render.com)
2. Click **New +** → **Web Service**
3. Connect your **private** GitHub repository
4. Render will auto-detect the Dockerfile
5. Configure the service:
   - **Name**: Choose a name (e.g., `goat-bot-v2`)
   - **Environment**: Docker
   - **Region**: Choose closest to you
   - **Branch**: main (or your default branch)

### Step 3: Deploy

1. Click **"Create Web Service"**
2. Wait for the build to complete (3-5 minutes)
3. Monitor the logs - you should see "SUCCESS: Launch bot successfully"
4. Your bot will be live at `https://your-service-name.onrender.com`

### Step 4: Monitor & Verify

- Check the Render logs for any errors
- Visit your service URL to see the bot status page
- Send a message to your bot on Facebook to test it

## Important Notes

- Keep your repository **PRIVATE** since it contains Facebook credentials
- The bot will read `account.txt` from the project root
- Render's free tier may cause the bot to sleep after inactivity - upgrade to keep it always running

## Troubleshooting

### Error: "ENOENT: no such file or directory, stat '/app/account.txt'"

**Solution:** You need to add your Facebook credentials before deploying. The `account.txt` file is not included in the repository for security reasons.

**Note:** When `NODE_ENV=production`, the bot automatically uses `account.dev.txt`. The Dockerfile handles this by copying `account.txt` to `account.dev.txt` during build.

### Error: "Cannot read properties of undefined (reading 'value')"

**Solution:** Your `account.txt` file is empty or invalid. Make sure it contains valid Facebook cookies in the correct JSON format.

### Bot gets logged out frequently

**Solution:** 
- Use a dedicated Facebook account (not your main account)
- Enable "intervalGetNewCookie" in `config.json`
- Add your email/password to `config.json` for auto-refresh

## Security Best Practices

1. ✅ Never commit `account.txt` to public repositories
2. ✅ Use a clone/throwaway Facebook account
3. ✅ Keep your repository private if it contains credentials
4. ✅ Rotate credentials regularly
5. ✅ Monitor bot activity for unusual behavior

## Support

If you encounter issues:
- Check Render logs for detailed error messages
- Join the [Messenger Support Group](https://m.me/j/AbZX5he4yIFsgui_/)
- Visit the [GitHub Issues](https://github.com/ntkhang03/Goat-Bot-V2/issues)
