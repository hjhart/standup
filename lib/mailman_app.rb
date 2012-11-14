#!/Users/jhart/.rvm/rubies/jruby-1.7.0/bin/jruby

# mailman_app.rb
require 'mailman'
require 'yaml'
require 'awesome_print'

LOGGER_FILE = File.join(Mailman.config.rails_root, 'log', 'mailman.log')
CONFIG_FILE = File.join(Mailman.config.rails_root, 'config', 'mailman.yml')

Mailman.config.ignore_stdin = true

Mailman.config.logger = Logger.new(LOGGER_FILE)

config = YAML::load(File.open(CONFIG_FILE))

Mailman.config.pop3 = {
    :username => config["username"],
    :password => config["password"],
    :server => config["server"],
    :port => config["port"],
    :ssl => config["ssl"]
}

Mailman.config.poll_interval = 0

Mailman::Application.run do
  default do
    begin
      user = User.find_by_email(message.from)
      DailyReportHandler.receive(message)
    rescue Exception => e
      Mailman.logger.error "Exception occurred while receiving message:\n#{message}"
      Mailman.logger.error [e, *e.backtrace].join("\n")
    end
  end
end
