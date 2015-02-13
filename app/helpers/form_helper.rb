module FormHelper
  def setup_word(word)
    word.definitions ||= Definition.new
    word
  end
end