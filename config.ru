require_relative './config/env'

use Rack::MethodOverride 
use ComicsController
use SessionsController
run ApplicationController 