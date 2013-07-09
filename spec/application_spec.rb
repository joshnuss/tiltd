require 'spec_helper'

describe Tiltd::Application do
  context "#call" do
    let(:app) { Tiltd::Application.new }
    let(:response) { app.call(:env) }

    specify { response[0].should == 200 }
    specify { response[1]['Content-Type'].should == 'text/html' }
    specify { response[1]['Cache-Control'].should == 'public, max-age=86400' }
    specify { response[2].should == ['']}
  end
end
