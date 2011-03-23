desc "minify css"
task :minify_css do
  compressor = YUI::CssCompressor.new

  Dir.glob("public/stylesheets/*").reject{|p| p =~ /min\.css/ }.each do |path|
    minified_path = path.sub(/\.css/, '.min.css')
    unminified = File.read(path)
    
    File.open(minified_path, 'w') do |f|
      f.write compressor.compress(unminified)
    end
  end
end
