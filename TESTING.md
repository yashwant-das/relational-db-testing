# Testing Guide

This guide provides multiple ways to test the relational database testing project, depending on your setup preferences.

## Prerequisites

- Node.js (v14 or higher)
- Python 3.7+
- A MySQL database (see options below)

## Database Options

### Option 1: Free Cloud Databases (Recommended)

#### PlanetScale (Easiest)
1. Visit [planetscale.com](https://planetscale.com)
2. Create free account (10GB included)
3. Create a new database
4. Copy connection string
5. Update `.env` file

#### Railway (Simple)
1. Visit [railway.app](https://railway.app)
2. Sign up ($5 credit included)
3. Create new project → Add MySQL
4. Copy connection details
5. Update `.env` file

#### FreeSQLDatabase (Basic)
1. Visit [freesqldatabase.com](https://freesqldatabase.com)
2. Create free MySQL database
3. Note: Limited features but works for testing

### Option 2: Local Installation

#### macOS
```bash
brew install mysql
brew services start mysql
```

#### Windows
1. Download MySQL from [mysql.com](https://mysql.com)
2. Install MySQL Server
3. Start MySQL service

#### Linux (Ubuntu/Debian)
```bash
sudo apt-get update
sudo apt-get install mysql-server
sudo systemctl start mysql
```

### Option 3: Development Packages

- **XAMPP**: Cross-platform (includes MySQL)
- **MAMP**: macOS/Windows
- **WAMP**: Windows only

## Quick Test Steps

### 1. Setup Environment
```bash
# Copy environment template
cp .env.example .env

# Edit .env with your database credentials
nano .env  # or use any text editor
```

### 2. Install Dependencies
```bash
# Install Node.js packages
npm install

# Install Python packages
cd python
pip install -r requirements.txt
cd ..
```

### 3. Test Database Connection
```bash
# Test connection before running full tests
npm run test:connection
```

### 4. Run Tests

**All tests:**
```bash
npm run test:all  # If Docker is available
# OR
npm run test:no-docker  # For guided setup without Docker
```

**Individual tests:**
```bash
# Node.js only
npm test

# Python only
cd python && python users.py
```

## Troubleshooting

### Common Issues

1. **Connection Refused**
   - Check if database server is running
   - Verify host and port in `.env`

2. **Access Denied**
   - Verify username/password in `.env`
   - Check user permissions

3. **Database Not Found**
   - Create database manually or update DB_NAME in `.env`

4. **Module Not Found**
   - Run `npm install` for Node.js
   - Run `pip install -r requirements.txt` for Python

### Getting Help

1. **Check configuration:**
   ```bash
   npm run test:connection
   ```

2. **Use guided setup:**
   ```bash
   ./test-without-docker.sh
   ```

3. **Check logs:**
   - Look for specific error messages
   - Verify .env file format
   - Test database access with MySQL client

## Database Providers Comparison

| Provider | Free Tier | Setup Difficulty | Best For |
|----------|-----------|------------------|----------|
| PlanetScale | 10GB | Easy | Production-like testing |
| Railway | $5 credit | Easy | Quick prototyping |
| Local MySQL | Unlimited | Medium | Development |
| FreeSQLDatabase | 5MB | Easy | Basic testing |
| Docker | Unlimited | Easy* | Consistent environment |

*Requires Docker installation

## Example .env Files

**PlanetScale:**
```env
DB_HOST=your-db.psdb.cloud
DB_USER=your-username
DB_PASSWORD=your-password
DB_PORT=3306
DB_NAME=your-database
```

**Railway:**
```env
DB_HOST=containers-us-west-xyz.railway.app
DB_USER=root
DB_PASSWORD=generated-password
DB_PORT=1234
DB_NAME=railway
```

**Local MySQL:**
```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your-password
DB_PORT=3306
DB_NAME=UsersDB
```
