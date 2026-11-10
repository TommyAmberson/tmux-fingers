require "../../spec_helper"
require "../../../src/fingers/config"

describe Fingers::Config do
  describe "#alphabet" do
    it "uses the keyboard layout by default" do
      config = Fingers::Config.new(keyboard_layout: "qwerty-homerow")

      config.alphabet.should eq %w[a s d f j k l g h]
    end

    it "prefers the alphabet override, without clashing or repeated letters" do
      config = Fingers::Config.new(keyboard_layout: "qwerty", alphabet_override: "tqeeciah")

      config.alphabet.should eq %w[t e a h]
    end
  end
end
