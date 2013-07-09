require 'spec_helper'

describe Tiltd::Content do
  context "#locate" do
    subject { Tiltd::Content.locate('/foo/other')}

    context "found" do
      before do
        Dir.should_receive(:glob).with('foo/other.*').and_return(['foo/other.haml'])
        File.should_receive(:file?).with('foo/other.haml').and_return(true)
        Tiltd::Content.should_receive(:new).with('foo/other.haml').and_return(:content)
      end

      specify { should == :content}
    end

    context "not found" do
      before do
        Dir.should_receive(:glob).with('foo/other.*').and_return([])
      end

      context "index exists" do
        before do
          Dir.should_receive(:glob).with('foo/other/index.*').and_return(['foo/other/index.haml'])
          File.should_receive(:file?).with('foo/other/index.haml').and_return(true)
          Tiltd::Content.should_receive(:new).with('foo/other/index.haml').and_return(:content)
        end
        specify { should == :content}
      end

      context "index missing" do
        before do
          Dir.should_receive(:glob).with('foo/other/index.*').and_return([])
          Tiltd::Content.should_not_receive(:new)
        end
        specify { should be_nil}
      end
    end
  end

  context "located" do
    let(:template) { stub(:template_class, render: 'example content')}
    let(:template_class) { mock(:template_class, default_mime_type: 'text/css')}

    before do
      Tilt.should_receive(:[]).with('foo/other.haml').and_return(template_class)
      template_class.should_receive(:new).with('foo/other.haml').and_return(template)
    end

    subject { Tiltd::Content.new('foo/other.haml') }

    its(:mime_type) { should == 'text/css' }
    its(:body) { should == 'example content' }
  end
end
