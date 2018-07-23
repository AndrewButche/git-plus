git = require('../git-es').default
ActivityLogger = require('../activity-logger').default

module.exports = (repo, {message}={}) ->
  cwd = repo.getWorkingDirectory()
  args = ['stash', 'save']
  args.push(message) if message
  git(args, {cwd, color: true})
  .then (result) ->
    ActivityLogger.record(Object.assign({message: 'Stash changes'} ,result))
