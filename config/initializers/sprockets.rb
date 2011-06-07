require 'sprockets/engines'

module Railsapp
  
  class HjsTemplate < Tilt::Template
    def self.default_mime_type
      'text/x.handlebars+html'
    end

    def initialize_engine
    end

    def prepare
    end

    def evaluate(scope, locals, &block)
      template = data.dup
      template.gsub!(/"/, '\\"')
      template.gsub!(/\r?\n/, '\\n')
      template.gsub!(/\t/, '\\t')
      "SC.TEMPLATES[\"#{scope.logical_path}\"] = SC.Handlebars.compile(\"#{template}\");\n"
    end
  end

  ::Sprockets.register_engine '.hjs', HjsTemplate
  
end
