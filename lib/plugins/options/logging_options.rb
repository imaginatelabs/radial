require "thor"
require_relative "../../core/conf"

# Specify options for logging
# rubocop:disable Metrics/MethodLength
module LoggingOptions
  def self.included(thor)
    thor.class_eval do
      class_option :log_file,
                   desc: "File output is logged to.",
                   aliases: "-F",
                   default: false,
                   banner: "/path/to/log/file.log|(blank=radial.log)",
                   group: "logging"

      # TODO: Overload this to be able to take a log format string
      class_option :output_format,
                   desc: "File format for log output.",
                   aliases: "-O",
                   default: Conf.log.logger,
                   banner: Conf.log.logger_options.join("|"),
                   group: "logging"

      class_option :log_level,
                   desc: "Level at which output is displayed.",
                   aliases: "-L",
                   default: Conf.log.level,
                   banner: Conf.log.level_options.join("|"),
                   group: "logging"
    end
  end
end
# rubocop:enable Metrics/MethodLength
