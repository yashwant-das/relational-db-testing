# Relational Database Testing

[![Tests](https://github.com/yashwant-das/relational-db-testing/actions/workflows/test.yml/badge.svg)](https://github.com/yashwant-das/relational-db-testing/actions/workflows/test.yml)

A comprehensive package for testing relational database operations using both **Node.js** and **Python**. This project demonstrates CRUD (Create, Read, Update, Delete) operations with MySQL databases using modern testing frameworks.

## Features

- **Dual Language Support**: Both JavaScript (Node.js) and Python implementations
- **Comprehensive Testing**: Jest and unittest frameworks with proper setup/teardown
- **Security First**: Parameterized queries to prevent SQL injection
- **Interactive Learning**: Jupyter notebook for exploration
- **CI/CD Ready**: GitHub Actions workflow included

## Prerequisites

- Node.js (v14 or higher)
- Python 3.7+
- MySQL database server
- npm or yarn package manager
- pip package manager

## Quick Start

### Automated Setup (Recommended)

```bash
# Clone the repository
git clone https://github.com/yashwant-das/relational-db-testing.git
cd relational-db-testing

# Run the automated setup and test script
./setup-and-test.sh
```

This script will:
- Check prerequisites (Docker, Node.js, Python)
- Start MySQL database using Docker
- Install all dependencies
- Run comprehensive tests
- Provide detailed results

### Manual Setup

#### 1. Start Database
```bash
# Start MySQL with Docker
npm run db:start

# Wait for MySQL to initialize (about 10 seconds)
```

#### 2. Setup Environment
```bash
# Copy environment file (no changes needed for Docker)
cp .env.example .env
```

#### 3. Install Dependencies
```bash
# Node.js
npm install

# Python
cd python
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
```

#### 4. Run Tests
```bash
# Test database connection
npm run test:connection

# Run all tests
npm test                     # Node.js tests
cd python && python users.py     # Python tests

# Stop database when done
npm run db:stop
```

## Project Structure

```text
relational-db-testing/
├── .github/
│   └── workflows/
│       └── test.yml       # GitHub Actions CI/CD workflow
├── config.js              # Database configuration for Node.js
├── sqlQueries.js          # SQL queries with parameterized statements
├── users.test.js          # Jest test suite
├── package.json           # Node.js dependencies and scripts
├── .env.example           # Environment variables template
└── python/
    ├── requirements.txt   # Python dependencies
    ├── users.py          # Python unittest implementation
    └── users.ipynb       # Jupyter notebook for interactive testing
```

## Database Schema

The project uses a simple `users` table:

```sql
CREATE TABLE `users` (
  `id` INT(2) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;
```

## Testing Details

### Node.js Tests (Jest)

- **Test Framework**: Jest
- **Database Library**: mysql2 with promise support
- **Features**:
  - Connection pooling
  - Automatic table setup/teardown
  - Fake data generation with Faker.js
  - Parameterized queries for security

### Python Tests (unittest)

- **Test Framework**: unittest
- **Database Library**: mysql-connector-python
- **Features**:
  - Environment variable configuration
  - Class-based test structure
  - Secure parameterized queries
  - Fake data generation with Faker

### Interactive Notebook

The Jupyter notebook (`python/users.ipynb`) provides:

- Step-by-step database operations
- Interactive code execution
- Educational documentation
- Visual feedback on operations

## Security Features

✅ **Parameterized Queries**: Prevents SQL injection attacks  
✅ **Environment Variables**: Secure credential management  
✅ **No Hardcoded Credentials**: All sensitive data externalized  
✅ **Input Validation**: Proper data type handling  

## CI/CD

The project includes GitHub Actions workflow for:

- Automated testing on push/pull requests
- Node.js and Python test execution in parallel
- MySQL database service integration
- Cross-platform testing on Ubuntu
- Test result reporting and artifact storage

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Ensure all tests pass
6. Submit a pull request

## Useful Commands

```bash
# Database management
npm run db:start          # Start MySQL container
npm run db:stop           # Stop MySQL container  
npm run db:logs           # View MySQL logs

# Testing
npm run test:connection   # Test database connection
npm test                  # Run Node.js tests
npm run test:all          # Run complete test suite

# Setup
npm run setup            # Install all dependencies
```

## System Requirements

- Node.js (v14 or higher)
- Python 3.7+
- Docker (for MySQL database)

## Environment Variables Reference

| Variable | Description | Default | Required |
|----------|-------------|---------|----------|
| `DB_HOST` | Database host address | localhost | Yes |
| `DB_USER` | Database username | - | Yes |
| `DB_PASSWORD` | Database password | - | Yes |
| `DB_PORT` | Database port | 3306 | No |
| `DB_NAME` | Database name | UsersDB | No |

## Troubleshooting

### Common Issues

1. **Connection Refused**: Check if MySQL server is running and credentials are correct
2. **Access Denied**: Verify user permissions and password
3. **Database Not Found**: Ensure the database exists or has proper creation permissions
4. **Port Issues**: Check if the specified port is correct and not blocked by firewall

### Debug Mode

For Node.js debugging, set the environment variable:

```bash
DEBUG=mysql* npm test
```

For Python debugging, enable logging:

```python
import logging
logging.basicConfig(level=logging.DEBUG)
```

## License

ISC License - see [LICENSE](LICENSE) file for details

For version history and changes, see [CHANGELOG.md](CHANGELOG.md)
