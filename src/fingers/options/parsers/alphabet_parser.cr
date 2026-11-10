module Fingers::Options::Parsers::AlphabetParser
  def valid?(value : String) : Tuple(Bool, String)
    return { true, "ok" } if value.empty?

    unless value.matches?(/\A[a-z]+\z/)
      return { false, "Invalid value '#{value}'. Only lowercase letters a-z are allowed" }
    end

    usable_letters = value.chars.uniq.reject { |char| char.to_s.matches?(Fingers::DISALLOWED_CHARS) }

    # A single letter cannot tell two matches apart.
    if usable_letters.size < 2
      return { false, "Invalid value '#{value}'. At least two different letters other than c, i, m and q are needed" }
    end

    { true, "ok" }
  end
end
