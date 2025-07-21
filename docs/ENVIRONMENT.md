# Environment Configuration Guide

This project uses a streamlined environment configuration setup optimized for Docker-first development.

## Files Overview

### `.env` (Git-ignored)
- Contains actual database connection values
- Used by the application at runtime
- Default values work with Docker setup

### `.env.example` 
- Template file committed to Git
- Copy to `.env` to get started
- Contains examples for external database providers

### `.env.development` (Optional)
- Development-specific overrides
- Useful for development-only settings
- Committed to Git for team consistency

## Quick Setup

### Option 1: Docker Setup (Recommended)
```bash
# 1. Copy template
cp .env.example .env

# 2. Start database
npm run db:start

# 3. Run tests
npm test
```

### Option 2: External Database
```bash
# 1. Copy template
cp .env.example .env

# 2. Edit .env with your database credentials
nano .env

# 3. Test connection
npm run test:connection
```

## Environment Variables

| Variable | Description | Default | Required |
|----------|-------------|---------|----------|
| `DB_HOST` | Database host | `localhost` | Yes |
| `DB_USER` | Database username | `test_user` | Yes |
| `DB_PASSWORD` | Database password | `test_password` | Yes |
| `DB_PORT` | Database port | `3306` | Yes |
| `DB_NAME` | Database name | `UsersDB` | Yes |

## External Provider Examples

### AWS RDS
```env
DB_HOST=your-rds-endpoint.region.rds.amazonaws.com
DB_USER=your-username
DB_PASSWORD=your-password
DB_PORT=3306
DB_NAME=your-database
```

### PlanetScale
```env
DB_HOST=your-planetscale-host.psdb.cloud
DB_USER=your-username
DB_PASSWORD=your-password
DB_PORT=3306
DB_NAME=your-database
```

### Railway
```env
DB_HOST=containers-us-west-xyz.railway.app
DB_USER=root
DB_PASSWORD=your-password
DB_PORT=your-port
DB_NAME=railway
```

## Best Practices

1. **Never commit `.env`** - Contains sensitive credentials
2. **Keep `.env.example` updated** - Template for team members
3. **Use Docker for development** - Consistent environment
4. **Test connection first** - Run `npm run test:connection`
5. **Environment-specific files** - Use `.env.development` for dev overrides

## Troubleshooting

### Connection Issues
```bash
# Check if Docker is running
docker ps

# Start database if needed
npm run db:start

# Test connection
npm run test:connection
```

### Environment Loading
The application uses `dotenv` to load environment variables. Files are loaded in this order:
1. `.env.development` (if NODE_ENV=development)
2. `.env`

### Security Notes
- Environment files containing credentials are in `.gitignore`
- Use strong passwords for production databases
- Consider using environment-specific files for different deployments
