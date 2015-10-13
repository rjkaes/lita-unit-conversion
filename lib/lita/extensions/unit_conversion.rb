require 'ruby_units/namespaced'

module Lita
  module Extensions
    # Public: Convert any units supported by ruby-units.
    class UnitConversion < Handler
      route(
        /^convert (?:from )?(?<from>.*) (to|in|into) (?<to>.*)/, :convert,
        command: true,
        help: {
          'convert INPUT_UNITS to OUTPUT_UNIT' => 'Returns the conversion',
        }
      )

      def convert(response)
        from, to = transform_request(*extract_conversion_from(response))
        response.reply rewrite_output(::RubyUnits::Unit.new(from).convert_to(to).to_s('%0.2f'))
      rescue ArgumentError => _err
        response.reply "I'm sorry, but I cannot convert `#{from}` into `#{to}`."
      end

      Lita.register_handler(UnitConversion)

      private

      def extract_conversion_from(response)
        [response.match_data[:from], response.match_data[:to]]
      end

      def transform_request(from, to)
        [rewrite_input(from), rewrite_input(to)]
      end

      def rewrite_input(value)
        case value
        when /C(elsius)?/i
          value.sub(/C(elsius)?/i, 'tempC')
        when /F(arenheit)?/i
          value.sub(/F(arenheit)?/i, 'tempF')
        else
          value
        end
      end

      def rewrite_output(value)
        case value
        when /temp/
          # Convert the "temp" into the unicode degree symbol.
          value.sub(/ temp/, "\u00b0")
        else
          value
        end
      end
    end
  end
end
