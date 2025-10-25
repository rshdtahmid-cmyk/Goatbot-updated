# Overview

Goat Bot V2 is a comprehensive Facebook Messenger chatbot built with Node.js that operates using a personal Facebook account through an unofficial Facebook API. The bot provides extensive command handling, event management, user/thread data management, and a web-based dashboard for configuration. It supports multiple database backends (JSON, SQLite, MongoDB) and includes features like automated uptime monitoring, Google Drive integration, and extensive customization options.

# Recent Changes

## October 25, 2025 - Render Deployment & Security Improvements

### Dockerfile Optimization for Render
- Fixed Alpine package name (pkgconfig → pkgconf) for successful image builds
- Added comprehensive build dependencies for native packages (canvas, sqlite3)
- Optimized for production deployment on Render and other Docker platform.
### Documentation Updates
- Added ws3-fca (WebSocket v3 Facebook Chat API) information to README
- Expanded feature list highlighting bot capabilities
- Added dedicated Deployment section with Render instructions
- Updated Node.js version requirement to 18.x+ (recommended 20.x)
- Created render.yaml for automatic deployment configuration
- Simplified deployment: account.txt can be committed to private repositories
- Removed account.txt from .gitignore (keep repository PRIVATE)

### Build Artifacts
- Created .dockerignore for efficient Docker builds
- Added render.yaml for one-click Render deployment
- Improved .gitignore coverage for multi-platform development
- Created DEPLOYMENT.md with comprehensive deployment instructions
- Added account.txt.example as a template for Facebook credentials

## October 24, 2025 - Node.js Update and Dependency Fixes

### Node.js Version Update
- Upgraded from Node.js 16.x to Node.js 20.19.3 (LTS)
- Updated package.json to support Node.js >=18.x
- Rebuilt native modules (canvas) for compatibility with Node.js 20
- Fixed Windows-specific npm scripts to use Unix-compatible syntax

### Workflow Configuration
- Configured automatic bot startup workflow on port 5000
- Set up webview output type for uptime monitoring
- Bot now automatically starts when the Replit project is opened

### Security Updates
- Ran npm audit fix to address non-breaking security vulnerabilities
- Reduced vulnerabilities from 39 to 30
- Remaining vulnerabilities are primarily in unmaintained unofficial Facebook libraries (fca-liane-utils, fca-unofficial, ws3-fca) that are required for bot functionality

### Docker Configuration
- Updated Dockerfile to use Node.js 20 (Alpine) for smaller image size
- Added build dependencies for canvas package (Python, Cairo, build tools)
- Configured to expose port 5000 matching the bot's uptime server
- Added .dockerignore for optimized build performance
- Production-ready with minimal dependencies
- Fixed Render deployment issues with native module compilation

### Known Limitations
- Some vulnerabilities remain in unofficial Facebook libraries that are not actively maintained but required for the bot to function
- Breaking changes for some dependencies (eta, sequelize, validator) were not applied to maintain compatibility

# User Preferences

Preferred communication style: Simple, everyday language.

# System Architecture

## Core Architecture
The application follows a modular architecture with clear separation of concerns:

- **Entry Point**: `index.js` serves as the main entry point, spawning the main bot process (`Goat.js`) with automatic restart capabilities
- **Main Bot Logic**: `Goat.js` handles initialization, configuration validation, and core bot startup
- **Modular Design**: Separated into distinct modules for bot functionality, dashboard, database operations, and utilities

## Bot Framework
- **Event-Driven Architecture**: The bot uses an event-driven model to handle incoming messages, reactions, and Facebook events
- **Command System**: Modular command system with dynamic loading from the `scripts/cmds/` directory
- **Event Handlers**: Separate event handlers in `scripts/events/` for non-command interactions
- **Handler Chain**: Multi-layered handler system including authentication, data validation, and command execution

## Database Layer
- **Multi-Database Support**: Flexible database abstraction supporting JSON files, SQLite, and MongoDB
- **Data Controllers**: Centralized data controllers for users, threads, dashboard, and global data
- **Task Queue System**: Implements task queuing for database operations to prevent conflicts
- **Auto-Sync**: Optional automatic synchronization with Facebook thread data

## Authentication & Security
- **Facebook Authentication**: Uses unofficial Facebook API with cookie-based authentication
- **Multi-Login Methods**: Supports email/password, cookie-based, and token-based login
- **Dashboard Authentication**: Separate authentication system for web dashboard access
- **Role-Based Access**: Hierarchical permission system (bot admin, thread admin, regular user)

## Web Dashboard
- **Express.js Backend**: Full-featured web interface for bot management
- **Session Management**: Secure session handling with passport.js
- **File Management**: Integration with Google Drive for file storage and management
- **Real-time Features**: Socket.io integration for real-time updates
- **Responsive UI**: Bootstrap-based responsive interface

## External Integrations
- **Google Services**: Deep integration with Google Drive API and Gmail for notifications
- **reCAPTCHA**: Google reCAPTCHA integration for security
- **Social Media**: Support for various social media content fetching
- **Uptime Monitoring**: Built-in uptime monitoring with external service integration

## Configuration Management
- **Environment-Aware**: Separate configurations for development and production
- **Hot Reloading**: Dynamic configuration updates without restart
- **Command Configuration**: Granular per-command configuration system
- **Global Settings**: Centralized global configuration management

## Error Handling & Logging
- **Comprehensive Logging**: Multi-level logging system with timestamps and color coding
- **Error Recovery**: Automatic restart mechanisms and error recovery
- **Notification System**: Email and Telegram notifications for critical errors
- **Debug Support**: Built-in debugging and development tools

# External Dependencies

## Core Dependencies
- **Node.js Runtime**: Requires Node.js 18.x+ for execution (currently using Node.js 20.19.3 LTS)
- **Facebook Chat API**: Custom unofficial Facebook API (`fb-chat-api`) for Messenger integration
- **Express.js**: Web server framework for dashboard functionality

## Database Systems
- **MongoDB**: Optional NoSQL database with Mongoose ODM
- **SQLite**: Local database option using Sequelize ORM
- **JSON Files**: Simple file-based storage option

## Google Services
- **Google Drive API**: File storage and management through Google Drive
- **Gmail API**: Email notifications and verification codes
- **Google reCAPTCHA**: Bot protection and user verification

## Authentication & Security
- **Passport.js**: Authentication middleware for dashboard
- **bcrypt**: Password hashing and validation
- **express-session**: Session management for web interface

## Communication & Notifications
- **Nodemailer**: Email sending capabilities
- **Socket.io**: Real-time web communication
- **MQTT**: Message queuing for Facebook API communication

## Utility Services
- **Axios**: HTTP client for API requests
- **Cheerio**: HTML parsing and web scraping
- **Moment.js**: Date and time manipulation
- **Canvas**: Image processing and generation

## Development & Monitoring
- **Socket.io**: Real-time monitoring capabilities
- **Express Rate Limiting**: API rate limiting and protection
- **File Upload**: Multi-part file upload handling
- **CORS**: Cross-origin resource sharing support

## Media Processing
- **ytdl-core**: YouTube video downloading
- **Canvas**: Image manipulation and generation
- **Mime-DB**: File type detection and handling

## External Monitoring
- **Uptime Services**: Integration with UptimeRobot or Better Stack for monitoring
- **Replit/Glitch**: Cloud hosting platform compatibility
- **Telegram Bot API**: Alternative notification channel