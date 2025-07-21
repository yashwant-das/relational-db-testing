# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0] - 2025-07-21

### Added

- ISC License file (LICENSE)
- Comprehensive documentation in README.md
- Environment configuration with .env.example
- CircleCI integration for Python tests
- Test runner script (run-tests.sh)
- Enhanced error handling and logging
- Jupyter notebook with interactive demonstrations

### Changed

- **BREAKING**: Updated to latest package versions:
  - Python: mysql-connector-python 8.0.26 → 9.3.0
  - Python: faker 8.10.0 → 37.4.2
  - Python: python-dotenv 0.19.0 → 1.1.1
  - Python: pytest 7.4.0 → 8.4.1
  - Node.js: jest 29.7.0 → 30.0.4
  - Node.js: mysql2 3.9.2 → 3.14.2
  - Node.js: dotenv 16.0.3 → 17.2.0
  - Node.js: faker 5.5.3 → @faker-js/faker 9.5.0 (modern package with `faker.person.fullName()`)
- Improved SQL security with parameterized queries
- Enhanced test coverage with UPDATE and DELETE operations
- Better database connection management
- Unified .gitignore for both Python and Node.js

### Security

- Fixed SQL injection vulnerabilities in JavaScript code
- Removed hardcoded database credentials
- Added secure environment variable configuration
- Implemented parameterized queries across all database operations

### Fixed

- Consistent error handling across implementations
- Proper database connection cleanup
- Cross-platform compatibility improvements

## [1.0.0] - 2025-07-21

### Initial Release

- Initial project setup
- Basic CRUD operations for MySQL database
- Node.js implementation with Jest testing
- Python implementation with unittest
- Basic CircleCI configuration
- Faker.js integration for test data generation
