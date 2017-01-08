watch(%r{tasks/(\d+)/solution.rb}) do |match|
  system "clear"
  system "bundle exec rake check[#{match[1]}]"
end
