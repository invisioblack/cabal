module GameSetting
  def GameSetting.load(*args)
     Setting.load(args.collect { |a| "#{XMLData.game}:#{a}" })
  end
  def GameSetting.save(hash)
     game_hash = Hash.new
     hash.each_pair { |k,v| game_hash["#{XMLData.game}:#{k}"] = v }
     Setting.save(game_hash)
  end
end

module CharSetting
  def CharSetting.load(*args)
     Setting.load(args.collect { |a| "#{XMLData.game}:#{XMLData.name}:#{a}" })
  end
  def CharSetting.save(hash)
     game_hash = Hash.new
     hash.each_pair { |k,v| game_hash["#{XMLData.game}:#{XMLData.name}:#{k}"] = v }
     Setting.save(game_hash)
  end
end

module GameSettings
  def GameSettings.[](name)
     Settings.to_hash(XMLData.game)[name]
  end
  def GameSettings.[]=(name, value)
     Settings.to_hash(XMLData.game)[name] = value
  end
  def GameSettings.to_hash
     Settings.to_hash(XMLData.game)
  end
end