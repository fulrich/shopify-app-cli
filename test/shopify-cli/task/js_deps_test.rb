require 'test_helper'

module ShopifyCli
  module Tasks
    class JsDepsTest < MiniTest::Test
      include TestHelpers::Project

      def setup
        project_context('app_types', 'node')
      end

      def test_installs_with_npm
        ShopifyCli::Tasks::JsDeps.any_instance.stubs(:installer).returns(:npm)
        CLI::Kit::System.expects(:system).with(
          'npm', 'install', '--no-optional',
          chdir: @context.root,
        ).returns(mock(success?: true))
        io = capture_io do
          ShopifyCli::Tasks::JsDeps.call(@context.root)
        end
        output = io.join
        assert_match('Installing dependencies with npm...', output)
      end

      def test_installs_with_yarn
        ShopifyCli::Tasks::JsDeps.any_instance.stubs(:installer).returns(:yarn)
        CLI::Kit::System.expects(:system).with(
          'yarn',
          chdir: @context.root
        ).returns(mock(success?: true))
        io = capture_io do
          ShopifyCli::Tasks::JsDeps.call(@context.root)
        end
        output = io.join
        assert_match('Installing dependencies with yarn...', output)
      end
    end
  end
end
