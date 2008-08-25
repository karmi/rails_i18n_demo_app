require 'active_support/vendor'
# require 'i18n/backend/chain'

module I18n
  class << self
    def available_locales
      backend.available_locales
    end      
  end
  
  module Backend
    class Simple
      def available_locales
        translations.keys #.collect{ |l| l.to_s }
      end      
    end
    
    # class Chain
    #   def populate(&block)
    #     backends.each{|backend| backend.populate(&block) }
    #   end
    #   
    #   def available_locales
    #     backends.map do |backend| 
    #       backend.available_locales if backend.respond_to? :available_locales
    #     end.flatten.uniq
    #   end      
    # end
    
    class CzechPluralization < Simple
      def pluralize(locale, entry, count)
        return entry unless entry.is_a?(Hash) and count
        key = :zero if count == 0 && entry.has_key?(:zero)
        if locale == 'cz'
          key ||= count == 1 ? :one : (2..4).include?(count) ? :few : :other
        else
          key ||= count == 1 ? :one : :other
        end
        raise InvalidPluralizationData.new(entry, count) unless entry.has_key?(key)
        entry[key]
      end
    end
  end
end

I18n.backend = I18n::Backend::CzechPluralization.new
# I18n.backend.add I18n::Backend::Simple.new


