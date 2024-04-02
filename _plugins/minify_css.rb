module Jekyll
  module MinifyCssFilter
    def minify_css(input)
      # Remove comments
      input.gsub!(/\/\*[\s\S]*?\*\//, "")
      # Remove whitespace around { } : ; , and newline characters
      input.gsub!(/\s*{\s*/, "{")
      input.gsub!(/\s*}\s*/, "}")
      input.gsub!(/\s*:\s*/, ":")
      input.gsub!(/\s*;\s*/, ";")
      input.gsub!(/\s*,\s*/, ",")
      input.gsub!(/\s*\n\s*/, "")
      # Return the minified CSS
      input
    end
  end
end

Liquid::Template.register_filter(Jekyll::MinifyCssFilter)
