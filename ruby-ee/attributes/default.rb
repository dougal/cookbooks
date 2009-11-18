ruby_enterprise_edition Mash.new unless attribute?("ruby_enterprise_edition")
ruby_enterprise_edition[:url] = "http://de.mirror.rubyforge.org/emm-ruby/ruby-enterprise-1.8.7-2009.10.tar.gz" unless ruby_enterprise_edition.has_key?(:url)
ruby_enterprise_edition[:only_if] = 'which ruby && ruby -e "exit 1 if GC.respond_to?(:copy_on_write_friendly=)"' unless ruby_enterprise_edition.has_key?(:only_if)
