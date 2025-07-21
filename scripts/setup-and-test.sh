#!/bin/bash

# Complete test setup and execution script using Docker
# This script sets up everything needed and runs all tests

echo🐍 Testing Python implementation...
-----------------------------------
cd python
source venv/bin/activate
python src/users.py
PYTHON_EXIT_CODE=$?
cd ..lational Database Testing - Docker Setup & Test"
echo "===================================================="

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to check if Docker is running
docker_running() {
    docker info >/dev/null 2>&1
}

# Check prerequisites
echo "📋 Checking prerequisites..."

if ! command_exists docker; then
    echo "❌ Docker is not installed. Please install Docker first."
    echo "   Visit: https://docs.docker.com/get-docker/"
    exit 1
fi

if ! command_exists node; then
    echo "❌ Node.js is not installed. Please install Node.js first."
    echo "   Visit: https://nodejs.org/"
    exit 1
fi

if ! command_exists python3; then
    echo "❌ Python 3 is not installed. Please install Python 3 first."
    echo "   Visit: https://python.org/"
    exit 1
fi

if ! docker_running; then
    echo "❌ Docker is not running. Please start Docker and try again."
    exit 1
fi

echo "✅ All prerequisites found!"

# Setup environment
echo ""
echo "🔧 Setting up environment..."

if [ ! -f .env ]; then
    echo "📝 Creating .env file from template..."
    cp .env.example .env
    echo "✅ .env file created with Docker MySQL configuration"
else
    echo "✅ .env file already exists"
fi

# Start MySQL with Docker
echo ""
echo "🐳 Starting MySQL database with Docker..."
echo "📥 Starting MySQL container..."
docker-compose up -d

echo "⏳ Waiting for MySQL to be ready..."
sleep 10

# Check if MySQL is running
if docker-compose ps | grep -q "mysql.*Up"; then
    echo "✅ MySQL database is running!"
else
    echo "❌ Failed to start MySQL database"
    echo "   Check Docker logs: docker-compose logs mysql"
    exit 1
fi

# Install Node.js dependencies
echo ""
echo "📦 Installing Node.js dependencies..."
npm install

if [ $? -eq 0 ]; then
    echo "✅ Node.js dependencies installed successfully"
else
    echo "❌ Failed to install Node.js dependencies"
    exit 1
fi

# Install Python dependencies
echo ""
echo "🐍 Installing Python dependencies..."
cd python

if [ ! -d "venv" ]; then
    echo "📦 Creating Python virtual environment..."
    python3 -m venv venv
fi

source venv/bin/activate
pip install -r requirements.txt

if [ $? -eq 0 ]; then
    echo "✅ Python dependencies installed successfully"
else
    echo "❌ Failed to install Python dependencies"
    exit 1
fi

cd ..

# Test database connection
echo ""
echo "🔗 Testing database connection..."
npm run test:connection

if [ $? -ne 0 ]; then
    echo "❌ Database connection failed"
    exit 1
fi

# Run tests
echo ""
echo "🧪 Running all tests..."
echo "======================"

echo ""
echo "📝 Testing Node.js implementation..."
echo "------------------------------------"
npm test

NODE_EXIT_CODE=$?

echo ""
echo "🐍 Testing Python implementation..."
echo "-----------------------------------"
cd python
source venv/bin/activate
python users.py
PYTHON_EXIT_CODE=$?
cd ..

# Summary
echo ""
echo "📊 Test Results Summary"
echo "======================"

if [ $NODE_EXIT_CODE -eq 0 ]; then
    echo "✅ Node.js tests: PASSED"
else
    echo "❌ Node.js tests: FAILED"
fi

if [ $PYTHON_EXIT_CODE -eq 0 ]; then
    echo "✅ Python tests: PASSED"
else
    echo "❌ Python tests: FAILED"
fi

echo ""
echo "🎯 Next Steps:"
echo "- Stop MySQL: npm run db:stop"
echo "- Restart MySQL: npm run db:start"
echo "- View logs: npm run db:logs"
echo "- Run individual tests:"
echo "  • Node.js: npm test"
echo "  • Python: cd python && source venv/bin/activate && python src/users.py"

if [ $NODE_EXIT_CODE -eq 0 ] && [ $PYTHON_EXIT_CODE -eq 0 ]; then
    echo ""
    echo "🎉 All tests passed! Your setup is working perfectly!"
    exit 0
else
    echo ""
    echo "⚠️  Some tests failed. Check the output above for details."
    exit 1
fi
