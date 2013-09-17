require "mongoid"

module Vidibus
  module Textile
    module Mongoid
      extend ActiveSupport::Concern
      module ClassMethods

        # Define existing attribute as textile.
        def textile(*args)
          options = args.extract_options!
          for field in args
            plain_field = "#{field}_plain"
            self.send(:field, field, :type => Moped::BSON::Binary)
            self.send(:field, plain_field, :type => Moped::BSON::Binary)

            class_eval <<-EOS
              before_save :set_#{plain_field}, :if => lambda {#{field}_changed? or new_record?}

              def set_#{plain_field}
                self.#{plain_field} = #{plain_field}
              end

              def #{plain_field}
                if #{field}_changed? or new_record?
                  Vidibus::Textile.new(#{field}).to_text(:plain => true)
                else
                  read_attribute(:#{plain_field})
                end
              end

              def #{field}_html
                return "" unless #{field}
                Vidibus::Textile.new(#{field}).to_html
              end
            EOS
          end
        end
      end
    end
  end
end
