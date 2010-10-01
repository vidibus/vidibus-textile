module Vidibus
  module Textile
    module Extensions
      module View
        extend ActiveSupport::Concern

        # Returns plain text without markup.
        # If option :plain is true, newlines will be removed.
        def stripped(string, options = {})
          string ? Vidibus::Textile.new(string).to_text(options) : ""
        end
      end
    end
  end
end
