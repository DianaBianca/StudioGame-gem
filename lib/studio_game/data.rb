# data.rb
module  StudioGame
  class Data
    def self.define(*attributes)
      Class.new do
        attributes.each do |attribute|
          define_method(attribute) do
            instance_variable_get("@#{attribute}")
          end
        end

        define_method(:initialize) do |*values|
          attributes.each_with_index do |attribute, index|
            instance_variable_set("@#{attribute}", values[index])
          end
        end
      end
    end
  end
end 