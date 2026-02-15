// Run server + client without needing 'concurrently'
const { spawn } = require('child_process');
const path = require('path');

const root = __dirname;
const isWin = process.platform === 'win32';

// Use relative paths so folder names with spaces don't break on Windows
const server = spawn('npm', ['run', 'dev', '--prefix', 'server'], {
  cwd: root,
  stdio: 'inherit',
  shell: isWin
});

const client = spawn('npm', ['run', 'dev', '--prefix', 'client'], {
  cwd: root,
  stdio: 'inherit',
  shell: isWin
});

server.on('error', (err) => console.error('Server error:', err));
client.on('error', (err) => console.error('Client error:', err));
process.on('SIGINT', () => { server.kill(); client.kill(); process.exit(); });
