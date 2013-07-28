require 'spec_helper'

describe Tiltd::Application do
  context "#call" do
    let(:app) { Tiltd::Application.new }
    let(:request) { stub(path_info: '/foo/other') }
    let(:response) { app.call(:env) }

    before do
      Rack::Request.should_receive(:new).with(:env).and_return(request)
    end

    context "file exists" do
      it "uses rack file" do
        rack_file = mock(:rack_file)
        File.should_receive(:exists?).with('foo/other').and_return(true)
        Rack::File.should_receive(:new).with(Dir.pwd).and_return(rack_file)
        rack_file.should_receive(:call).with(:env)

        app.call(:env)
      end
    end

    context "content found" do
      let(:content) { stub(body: 'content', mime_type: 'text/css') }
      before { Tiltd::Content.should_receive(:locate).with('/foo/other').and_return(content)}

      specify { response[0].should == 200 }
      specify { response[1]['Content-Type'].should == 'text/css' }
      specify { response[2].should == ['content']}
    end

    context "content not found" do
      before { Tiltd::Content.should_receive(:locate).with('/foo/other').and_return(nil) }

      specify { response[0].should == 404 }
      specify { response[1].should == {} }
      specify { response[2].should == ['']}
    end
  end
end
