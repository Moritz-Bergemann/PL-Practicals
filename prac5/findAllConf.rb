puts("Starting...")
result = Dir.glob("/**/*.conf");
puts("Finished!")

puts("Results found: " + result.length())

result.each { |ii|
    puts(ii)
}