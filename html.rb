module html {
    def self.make_tag(name, elements, symbol) {
        case symbol
        when :empty
            puts "<" + name + " " + elements + ">"
        when :sandwich
            return "<" + name + " " + elements + "></" + name + ">"
        when :selfclose
            return "<" + name + " />"
        end
    }
}

