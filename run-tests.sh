#!/bin/bash

# Test runner script for both Node.js and Python implementations
# This script runs all tests and provides a comprehensive report

echo "🚀 Relational Database Testing Suite"
echo "====================================="

# Check if .env file exists
if [ ! -f .env ]; then
    echo "⚠️  Warning: .env file not found. Using environment variables or defaults."
    echo "   Create .env file from .env.example for custom configuration."
    echo ""
fi

# Test Node.js implementation
echo "📦 Testing Node.js Implementation..."
echo "------------------------------------"

if [ ! -d "node_modules" ]; then
    echo "📥 Installing Node.js dependencies..."
    npm install
fi

echo "🧪 Running Jest tests..."
npm test

echo ""

# Test Python implementation
echo "🐍 Testing Python Implementation..."
echo "-----------------------------------"

cd python

if [ ! -d "venv" ]; then
    echo "📥 Creating Python virtual environment..."
    python3 -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt
else
    source venv/bin/activate
fi

echo "🧪 Running Python unittest..."
python users.py

echo ""
echo "🎉 All tests completed!"
echo "======================="
echo ""
echo "📋 Summary:"
echo "- Node.js tests: Check output above"
echo "- Python tests: Check output above"
echo ""
echo "💡 Tip: Run individual test suites with:"
echo "   npm test                    (Node.js)"
echo "   cd python && python users.py    (Python)"
