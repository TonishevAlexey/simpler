module Simpler
  class Router
    class Route

      attr_reader :controller, :action, :params

      def initialize(method, path, controller, action)
        @method = method
        @path = path
        @controller = controller
        @action = action
        @params = {}
      end

      def match?(method, path)
        @method == method && parse_string_path(path)
      end

      private

      def parse_string_path(path)
        router_path = path_parts(@path)
        request_path = path_parts(path)
        if request_path.size != router_path.size
          false
        elsif request_path == router_path
          true
        elsif router_path.to_s.include?(':')
          true
        else
          false
        end
      end

      def path_parts(path)
        path.split('/').reject!(&:empty?)
      end
    end
  end
end
