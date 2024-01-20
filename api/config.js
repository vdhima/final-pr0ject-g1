console.log('vasil', process.env.DATABASE_HOST, process.env.DATABASE_PORT, process.env.DATABASE_USER, process.env.DATABASE_PASSWORD, process.env.DATABASE_NAME,)

module.exports = {
  appName: 'gh',
  port: 5000,
  dbHost: process.env.DATABASE_HOST,
  dbPort: process.env.DATABASE_PORT,
  dbUser: process.env.DATABASE_USER,
  dbPassword: process.env.DATABASE_PASSWORD,
  dbName: process.env.DATABASE_NAME,
}
