module Lexicon
  @hash = {}
  @hash['direction'] = %W(north south east)
  @hash['verb'] = %W(go kill eat)
  @hash['stop'] = %W(the in of)
  @hash['noun'] = %W(bear princess)

  def Lexicon.scan(sentence)
    result = []
    sentence.split.map do |word|
      if @hash['direction'].include?(word)
        result << ['direction', word]
      elsif @hash['verb'].include?(word)
        result << ['verb', word]
      elsif @hash['stop'].include?(word)
        result << ['stop', word]
      elsif @hash['noun'].include?(word)
        result << ['noun', word]
      elsif /^\d+/ =~ word # ? true=index_at : false=nil
        result << ['number', word.to_i]
      else
        result << ['error', word]
      end
    end
    return result
  end
end
