$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'easyappstore/base'
require 'easyappstore/globals'
require 'easyappstore/base'
require 'easyappstore/client'
require 'easyappstore/provider'
require 'easyappstore/launcher'

require 'easyappstore/portal/portal'
require 'easyappstore/portal/easyappstore'

require 'easyappstore/tunes/tunes'

require 'easyappstore/tunes/easyappstore'
require 'easyappstore/base'

require 'easyappstore/module'


require 'easyappstore/portal/legacy_wrapper'
require 'easyappstore/tunes/legacy_wrapper'


require 'highline/import'
require 'colored'

require 'json'


require 'faraday' # HTTP Client
require 'faraday-cookie_jar'
require 'faraday_middleware'

user=""
pwd=""

Easyappstore::Tunes.login(USERNAME,PASSWORD)


BB=Easyappstore::Portal.login(USERNAME,PASSWORD)



