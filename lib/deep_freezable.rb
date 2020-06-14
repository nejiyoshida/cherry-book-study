module DeepFreezable
    def deep_freeze(array_or_hash)

        # case 変数、when 型（TFの条件）, caseのオブジェクトがwhenのオブジェクトかどうか（===）
        case array_or_hash
        when Array
            array_or_hash.each do |element|
                element.freeze
            end
        when Hash
            array_or_hash.each do |key, value|
                key.freeze
                value.freeze
            end
        end
        array_or_hash.freeze
    end
end
