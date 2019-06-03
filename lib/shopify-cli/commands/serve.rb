# frozen_string_literal: true

require 'shopify_cli'

module ShopifyCli
  module Commands
    class Serve < ShopifyCli::Command
      def call(*)
        tunnel = Tunnel.new
        tunnel.call(['start'], nil)
        @ctx.puts("Press {{command:ctrl-t}} to open your app in a new browser window")
        # project = ShopifyCli::Project.current
        # app_type = ShopifyCli::AppTypeRegistry[project.config["app_type"].to_sym]
        # @ctx.exec(app_type.serve_command(@ctx))
      end

      def self.help
        <<~HELP
          Run your projects server.
          Usage: {{command:#{ShopifyCli::TOOL_NAME} serve}}
        HELP
      end
    end
  end
end
