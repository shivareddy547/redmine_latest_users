module SettingsOverridePatch
  def self.included(base)
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods
    def plugin
      p "+++++++++++++++++++"
      p 333333333333333
      logger.info 'moo'
    end
  end
end
