###
This is separate CoffeeScript addon for Clinch processor
###
CoffeeScript  = require 'coffee-script'

# use bare to compile without a top-level function wrapper
CS_BARE = yes 

extension = '.coffee'

processor = (data, filename, cb) ->
  try
    content = CoffeeScript.compile data, { bare: CS_BARE, filename }
  catch error
    return cb error

  cb null, content, yes

module.exports = { extension, processor }
