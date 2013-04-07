require 'atomic'

module Peek
  module Views
    class Faraday < View
      def initialize(options = {})
        @duration = Atomic.new(0)
        @calls = Atomic.new(0)

        setup_subscribers
      end

      def formatted_duration
        ms = @duration.value * 1000
        if ms >= 1000
          "%.2fms" % ms
        else
          "%.0fms" % ms
        end
      end

      def results
        { :duration => formatted_duration, :calls => @calls.value }
      end

      private

      def setup_subscribers
        # Reset each counter when a new request starts
        before_request do
          @duration.value = 0
          @calls.value = 0
        end

        subscribe(/request.faraday/) do |name, start, finish, id, payload|
          duration = (finish - start)
          @duration.update { |value| value + duration }
          @calls.update { |value| value + 1 }
        end
      end
    end
  end
end
