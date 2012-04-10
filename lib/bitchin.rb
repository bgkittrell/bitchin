module Bitchin
  def bitchin(*flags)
    column = "bit_flag"
    if flags.first.is_a? Hash
      options = flags.shift 
      column = options[:column] if options[:column]
    end
    current_flag = 1
    for name in flags
      
      class_eval <<-METHOD
      def #{name.to_s + '?'}
        (#{current_flag} & self.#{column}) == #{current_flag}
      end
      
      def #{name.to_s}
        #{name.to_s + '?'}
      end
      
      def #{name.to_s}=(f)
        if f == true || f == "true"
          self.#{column} |= #{current_flag}
        else
          if (#{current_flag} & self.#{column}) == #{current_flag}
            self.#{column} ^= #{current_flag}
          end
        end
      end
      METHOD

      current_flag <<= 1
    end
  end
end
ActiveRecord::Base.send(:extend, Bitchin)
