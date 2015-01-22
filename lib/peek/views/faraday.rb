require 'atomic'

module Peek
  module Views
    class Faraday < View
      def initialize(options = {})
        @duration = Atomic.new(0)
        @calls = Atomic.new(0)
        @requests = Atomic.new([].freeze)

        setup_subscribers
      end

      def formatted_duration
        ms = @duration.value
        if ms >= 1000
          "%.2fms" % ms
        else
          "%.0fms" % ms
        end
      end

      def results
        { :duration => formatted_duration, :calls => @calls.value, :requests => @requests.value }
      end

      private

      def setup_subscribers
        # Reset each counter when a new request starts
        before_request do
          @duration.value = 0
          @calls.value = 0
          @requests.value = [].freeze
        end

        subscribe(/request.faraday/) do |name, start, finish, id, payload|
          duration = (finish - start) * 1000
          @duration.update { |value| value + duration }
          @calls.update { |value| value + 1 }
          @requests.update { |value| (value + [{:method => payload[:method].to_s.upcase, :path => payload[:url].to_s, :duration => '%.2fms' % duration, :callstack => clean_backtrace}]).freeze }
        end
      end

      def clean_backtrace
        Rails.backtrace_cleaner.clean(caller).join("\n")
      end
    end
  end
end
