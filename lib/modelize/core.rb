module Modelize
  module Core

    attr_accessor :doc

    # Read and write to the BSON::Document
    def method_missing(name, *args, &block)
      # Extract name and write mode
      name =~ /([^=]+)(=)?/

      # Call methods before instance variables
      return args[0] ? @doc.send($1, args[0]) : @doc.send($1) if @doc.respond_to?($1)

      # Write or read the BSON::Document, nil if nothing found
      return args[0] ? @doc[$1] = args[0] : @doc[$1]
    end
  end
end
