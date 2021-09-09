# Use glob to find all matching files anywhere in system
puts("Starting...")
result = Dir.glob("/**/*.conf");
puts("Finished!")

puts("# Results found: " + result.length())

# Print out results
result.each { |ii|
    puts(ii)
}