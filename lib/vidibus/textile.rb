require "vidibus/textile/extensions"
require "vidibus/textile/mongoid"

module Vidibus
  module Textile

    # A convenience method for creating a new TextileDoc. See
    # RedCloth::TextileDoc.
    def self.new(*args, &block)
      Doc.new(*args, &block)
    end

    # Include extension modules (if any) in TextileDoc.
    def self.include(*args)
      Doc.send(:include, *args)
    end

    class Doc < ::RedCloth::TextileDoc

      # Returns plain text without markup.
      # If option :plain is true, newlines will be removed.
      def to_text(options = {})
        text = strip_html(self.to_html)
        if options[:plain] == true
          return strip_newlines(text)
        end
        text
      end

      private

      # Remove html tags and redcloth glyphs from input string.
      def strip_html(input)
        input.dup.gsub(html_regexp, '').tap do |h|
          for entity, char in redcloth_glyphs
            h.gsub!(entity, char)
          end
        end
      end

      # Replace newlines by white space.
      def strip_newlines(input)
        input.gsub(/(\r?\n)+/," ")
      end

      # Returns a list of RedCloth conversions of special chars.
      def redcloth_glyphs
        {
          "&#8217;" => "'",
          "&#8216" => "'",
          "&lt;" => "<",
          "&gt;" => ">",
          "&#8221;" => '"',
          "&#8220;" => '"',
          "&#8230;" => "...",
          "\1&#8212;" => "--",
          " &rarr; " => "->",
          " &#8211; " => "-",
          "&#215;" => "-",
          "&#8482;" => "(TM)",
          "&#174;" => "(R)",
          "&#169;" => "(C)",
          "&amp;" => "&"
        }.freeze
      end

      # Returns regular expression to identifiy html tags.
      def html_regexp
        /<(?:[^>"']+|"(?:\\.|[^\\"]+)*"|'(?:\\.|[^\\']+)*')*>/xm
      end
    end
  end
end
