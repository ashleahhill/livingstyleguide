require 'test_helper'

describe LivingStyleGuide::Engine do

  describe "additional JavaScript" do

  before do
    @engine = LivingStyleGuide::Engine.new('', {}, {})
  end
    it "add javascript files before the content" do
      @engine.options[:javascript_before] << 'my-scripts.js'
      @engine.render.must_match %r(<head>.*<script.+?src="my-scripts.js"></script>.*</head>)m
    end

    it "add javascript files after the content" do
      @engine.options[:javascript_after] << 'my-other-scripts.js'
      @engine.render.must_match %r(<body.*?>.*<script.+?src="my-other-scripts.js"></script>.*</body>)m
    end

    it "add javascript code before the content" do
      @engine.options[:javascript_before] << 'alert("hello world")'
      @engine.render.must_match %r(<head>.*<script>alert\("hello world"\)</script>.*</head>)m
    end

    it "add javascript code after the content" do
      @engine.options[:javascript_after] << 'alert("hello world")'
      @engine.render.must_match %r(<body.*?>.*<script>alert\("hello world"\)</script>.*</body>)m
    end
  end

end
