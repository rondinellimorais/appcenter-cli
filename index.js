#!/usr/bin/env node
const fs = require('fs');

const raw = fs.readFileSync('output.json')

const codeOffset = process.env['VERSION_CODE_OFFSET']

JSON.parse(raw)
  .filter(({ status }) => ['notStarted', 'inProgress'].includes(status))
  .forEach(({ sourceBranch, buildNumber, status, author }) => {
    console.log(`Branch:    ${sourceBranch}`)
    console.log(`build:     ${parseInt(buildNumber) + parseInt(codeOffset)}`)
    console.log(`status:    ${status}`)
    console.log(`author:    ${author}\n`)
  });