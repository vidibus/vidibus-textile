require "vidibus/textile/extensions/view"

ActiveSupport.on_load(:action_view) do
  include Vidibus::Textile::Extensions::View
end
