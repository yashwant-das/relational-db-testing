const mysql = require('mysql2/promise');
require('dotenv').config();

async function testDatabaseConnection() {
    console.log('🔗 Testing database connection...');
    console.log('');
    
    // Display current configuration (without password)
    console.log('📋 Current configuration:');
    console.log(`   Host: ${process.env.DB_HOST || 'not set'}`);
    console.log(`   User: ${process.env.DB_USER || 'not set'}`);
    console.log(`   Port: ${process.env.DB_PORT || 'not set'}`);
    console.log(`   Database: ${process.env.DB_NAME || 'not set'}`);
    console.log(`   Password: ${process.env.DB_PASSWORD ? '***set***' : 'not set'}`);
    console.log('');

    try {
        const connection = await mysql.createConnection({
            host: process.env.DB_HOST,
            user: process.env.DB_USER,
            password: process.env.DB_PASSWORD,
            port: process.env.DB_PORT,
            database: process.env.DB_NAME
        });

        console.log('✅ Database connection successful!');
        
        // Test basic query
        const [rows] = await connection.execute('SELECT 1 as test');
        console.log('✅ Basic query test passed');
        
        // Test database info
        const [info] = await connection.execute('SELECT VERSION() as version');
        console.log(`✅ MySQL version: ${info[0].version}`);
        
        await connection.end();
        
        console.log('');
        console.log('🎉 All connection tests passed!');
        console.log('🎯 You can now run the full test suite:');
        console.log('   • Node.js tests: npm test');
        console.log('   • Python tests: cd python && python users.py');
        
    } catch (error) {
        console.log('❌ Database connection failed:');
        console.log(`   Error: ${error.message}`);
        console.log('');
        console.log('💡 Common solutions:');
        console.log('   • Check your .env file exists and has correct values');
        console.log('   • Verify database server is running');
        console.log('   • Confirm database name exists');
        console.log('   • Check firewall/network settings');
        console.log('   • Ensure user has proper permissions');
        console.log('');
        console.log('🔧 Quick fixes:');
        console.log('   • Copy .env.example to .env: cp .env.example .env');
        console.log('   • Edit .env with your database credentials');
        console.log('   • Or start Docker database: npm run db:start');
        
        process.exit(1);
    }
}

// Check if .env file exists
const fs = require('fs');
if (!fs.existsSync('.env')) {
    console.log('⚠️  No .env file found!');
    console.log('');
    console.log('🔧 Quick setup:');
    console.log('   1. Copy template: cp .env.example .env');
    console.log('   2. Edit .env with your database credentials');
    console.log('   3. Run this test again: node test-connection.js');
    console.log('');
    console.log('💡 Or start Docker database: npm run db:start');
    process.exit(1);
}

testDatabaseConnection();
