require 'aruba/cucumber'
require File.expand_path(File.join(File.dirname(__FILE__), '../../spec/support/locale_app_integration_data'))
World(LocaleAppIntegrationData)

ENV['PATH'] = "#{File.expand_path(File.dirname(__FILE__) + '/../../bin')}#{File::PATH_SEPARATOR}#{ENV['PATH']}"

module FakeWebHelper
  def add_fake_web_uri(method, uri, status, body)
    fakes = JSON.parse(ENV['FAKE_WEB_FAKES'] || '[]')
    fakes << {
      'method' => method,
      'uri' => uri,
      'status' => status,
      'body' => body
    }
    ENV['FAKE_WEB_FAKES'] = fakes.to_json
  end
end
World(FakeWebHelper)
