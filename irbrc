require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = File.join ENV['HOME'], ".irb_history"

if defined?(Rails)
  require 'logger'
  logger = Logger.new(STDOUT)
  ActiveRecord::Base.logger = logger if defined?(ActiveRecord::Base)
  ActiveResource::Base.logger = logger if defined?(ActiveResource::Base)

  # app name in prompt
  app_name = ObjectSpace.each_object(Rails::Application).first.class.name.split("::").first
  rails_env = Rails.env == 'production' ? "\001\e[31m#{Rails.env}\e[0m\002" : "\001\e[32m#{Rails.env}\e[0m\002"
  prompt = "#{app_name}|#{rails_env}"
  IRB.conf[:PROMPT][:RAILS_PROMPT] = { :PROMPT_I=>"(#{prompt})(%m):%03n:%i> ",
    :PROMPT_N=>"(%m):%03n:%i> ", 
    :PROMPT_S=>"(#{prompt})(%m):%03n:%i%l ", 
    :PROMPT_C=>"(#{prompt})(%m):%03n:%i* ",
    :RETURN=>"=> %s\n"
  }
  IRB.conf[:PROMPT_MODE] = :RAILS_PROMPT
end
