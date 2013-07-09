require 'spec_helper'

describe Tiltd::Content do
  context "#locate" do
    subject { Tiltd::Content.locate('/foo/other')}

    context "found" do
      before do
        Dir.should_receive(:glob).with('foo/other.*').and_return(['foo/other.haml'])
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


  context "#content_type"
  context "#body"
end
