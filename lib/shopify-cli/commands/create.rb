require 'shopify_cli'

module ShopifyCli
  module Commands
    class Create < ShopifyCli::Command
      autoload :Project, 'shopify-cli/commands/create/project'

      def call(args, name)
        subcommand = args.shift
        case subcommand
        when 'project'
          Project.new(@ctx).call(args, name)
        when 'dev-store'
          raise(ShopifyCli::Abort, 'This feature is not yet available')
        else
          @ctx.puts(self.class.help)
        end
      end

      def self.help
        <<~HELP
          Create a new app project.
            Usage: {{command:#{ShopifyCli::TOOL_NAME} create project <appname>}}
        HELP
      end

      def self.extended_help
        <<~HELP
          {{bold:Subcommands:}}

            {{cyan:project}}: Creates an app based on type selected.
              Usage: {{command:#{ShopifyCli::TOOL_NAME} create project <appname>}}

            {{cyan:dev-store}}: {{yellow: Create dev-store is not currently available.}}
        HELP
      end
    end
  end
end
