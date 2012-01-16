require 'mida_vocabulary/datatype/generic'
require 'mida_vocabulary/datatype/url'
require 'uri'

module Mida
  module DataType

    # Enumeration data type
    # Provides access to underly DataType methods
    # Subclasses should implement VALID_VALUES as an array of the form:
    # [[DataType, Regexp], [DataType, Regexp]]
    class Enumeration < Generic

      Enumeration.reveal(:class)

      # Raises +ArgumentError+ if value not valid value
      def initialize(value)
        value_is_valid = self.class::VALID_VALUES.any? do |valid_value|
          @parsedValue = valid_value[0].parse(value)
          @parsedValue.to_s =~ valid_value[1]
        end
        raise ArgumentError unless value_is_valid 
      end

    end

  end
end
