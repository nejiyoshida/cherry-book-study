
def to_hex(r,g,b)

    hex = "#"
    [r, g, b].inject("#") {|hex, n| hex += n.to_s(16).rjust(2, "0")}
end

def to_ints(hex)
    #r,g,b = hex.scan(/\w\w/)
    #[r,g,b].map do |s|
    #hex.scan(/\w\w/).map do |s|
    #    s.hex
    #end
    hex.scan(/\w\w/).map(&:hex)
end