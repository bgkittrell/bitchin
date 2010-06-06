module Hashed
  def hashed(*args)
    column = "hash_field"
    if args.first.is_a? Hash
      options = args.shift 
      column = options[:column] if options[:column]
    end
    for name in args
      class_eval <<-METHOD
      serialize :#{column}

      def #{name.to_s}
        #{column}[:#{name.to_s}] unless #{column}.nil?
      end
      
      def #{name.to_s}=(f)
        #{column} = Hash.new if #{column}.nil?
        #{column}[:#{name.to_s}] = f
      end
      METHOD

    end
  end
end
