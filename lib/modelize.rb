module Modelize

  # # # # # #
  # Modelize MongoDB Documents for Minimongo and the Ruby Driver
  # @homepage: https://github.com/fugroup/modelize
  # @author:   Vidar <vidar@fugroup.net>, Fugroup Ltd.
  # @license:  MIT, contributions are welcome.
  # # # # # #

  class << self; attr_accessor :enable, :module, :debug; end

  # Disable / enable modelizing
  @enable = true

  # Which module the model class is in, ex: Fu::Models
  @module = ''

  # Debug option
  @debug = false

end

require_relative 'modelize/ext'
require_relative 'modelize/core'
