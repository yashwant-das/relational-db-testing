#!/bin/bash

# Alternative test setup without Docker
# This script provides multiple database testing options

echo "🚀 Relational Database Testing - Alternative Setup"
echo "=================================================="

echo ""
echo "Since Docker is not available, here are your options:"
echo ""

echo "1. 🌐 Use a Free Cloud MySQL Database"
echo "   Recommended providers:"
echo "   • PlanetScale (https://planetscale.com) - 10GB free"
echo "   • Railway (https://railway.app) - \$5 credit"
echo "   • Aiven (https://aiven.io) - 1 month free trial"
echo "   • FreeSQLDatabase (https://www.freesqldatabase.com) - Free hosting"
echo ""

echo "2. 🖥️  Install MySQL Locally"
echo "   • macOS: brew install mysql"
echo "   • Windows: Download from mysql.com"
echo "   • Linux: sudo apt-get install mysql-server"
echo ""

echo "3. 🔧 Use MySQL in Development Packages"
echo "   • XAMPP (cross-platform)"
echo "   • MAMP (macOS/Windows)"
echo "   • WAMP (Windows)"
echo ""

echo "4. 🚀 Quick Test with Railway (Easiest)"
echo "   • Visit: https://railway.app"
echo "   • Click 'Start a New Project'"
echo "   • Choose 'Provision MySQL'"
echo "   • Copy connection details to .env file"
echo ""

read -p "Would you like to test with a specific database provider? (y/n): " choice

if [[ $choice == [Yy]* ]]; then
    echo ""
    echo "📝 Please update your .env file with your database credentials:"
    echo ""
    echo "DB_HOST=your-database-host"
    echo "DB_USER=your-username"
    echo "DB_PASSWORD=your-password"
    echo "DB_PORT=3306"
    echo "DB_NAME=your-database-name"
    echo ""
    
    read -p "Have you updated the .env file? (y/n): " env_ready
    
    if [[ $env_ready == [Yy]* ]]; then
        echo ""
        echo "🧪 Testing connection and running tests..."
        
        # Install Node.js dependencies
        echo "📦 Installing Node.js dependencies..."
        npm install
        
        # Test database connection
        echo "🔗 Testing database connection..."
        node -e "
        const mysql = require('mysql2/promise');
        require('dotenv').config();

        async function testConnection() {
            try {
                const connection = await mysql.createConnection({
                    host: process.env.DB_HOST,
                    user: process.env.DB_USER,
                    password: process.env.DB_PASSWORD,
                    port: process.env.DB_PORT,
                    database: process.env.DB_NAME
                });
                console.log('✅ Database connection successful!');
                await connection.end();
                return true;
            } catch (error) {
                console.log('❌ Database connection failed:', error.message);
                console.log('');
                console.log('💡 Troubleshooting tips:');
                console.log('   • Check your .env file credentials');
                console.log('   • Ensure the database exists');
                console.log('   • Verify network connectivity');
                console.log('   • Check if the database server is running');
                return false;
            }
        }

        testConnection().then(success => {
            if (success) {
                console.log('');
                console.log('🎯 Ready to run tests! Use these commands:');
                console.log('   Node.js tests: npm test');
                console.log('   Python tests: cd python && python users.py');
            }
        });
        "
        
    else
        echo "Please update your .env file and run this script again."
    fi
else
    echo ""
    echo "📚 For detailed setup instructions, check the README.md file."
    echo "   Each database provider has specific setup steps."
fi

echo ""
echo "🆘 Need help? Check these resources:"
echo "   • README.md - Complete setup guide"
echo "   • .env.example - Environment variable template"
echo "   • GitHub Issues - Report problems or ask questions"
