# Relational Database Testing

A comprehensive package for testing relational database operations using both **Node.js** and **Python**. This project demonstrates CRUD (Create, Read, Update, Delete) operations with MySQL databases using modern testing frameworks.

## Features

- **Dual Language Support**: Both JavaScript (Node.js) and Python implementations
- **Comprehensive Testing**: Jest and unittest frameworks with proper setup/teardown
- **Security First**: Parameterized queries to prevent SQL injection
- **Interactive Learning**: Jupyter notebook for exploration
- **CI/CD Ready**: CircleCI configuration included

## Prerequisites

- Node.js (v14 or higher)
- Python 3.7+
- MySQL database server
- npm or yarn package manager
- pip package manager

## Quick Start

### 1. Clone and Setup

```bash
git clone <repository-url>
cd relational-db-testing
```

### 2. Environment Configuration

Copy the example environment file and configure your database credentials:

```bash
cp .env.example .env
```

Edit `.env` with your database credentials:

```env
DB_HOST=your-database-host
DB_USER=your-username
DB_PASSWORD=your-password
DB_PORT=3306
DB_NAME=UsersDB
```

### 3. Node.js Setup

```bash
# Install dependencies
npm install

# Run tests
npm test
```

### 4. Python Setup

```bash
# Navigate to python directory
cd python

# Install dependencies
pip install -r requirements.txt

# Run tests
python users.py
```

## Project Structure

```text
relational-db-testing/
├── config.js              # Database configuration for Node.js
├── sqlQueries.js          # SQL queries with parameterized statements
├── users.test.js          # Jest test suite
├── package.json           # Node.js dependencies and scripts
├── .env.example           # Environment variables template
├── .circleci/
│   └── config.yml         # CircleCI configuration
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

The project includes CircleCI configuration for:

- Automated testing on commits
- Node.js test execution
- Test result reporting
- Artifact storage

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Ensure all tests pass
6. Submit a pull request

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
