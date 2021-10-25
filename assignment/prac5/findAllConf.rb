# Use glob to find all matching files anywhere in system
puts("Starting...")
root = "/mnt/c/Users/morit/_MyCode/PL/assignment/prac5/test_folder";

result = Dir.glob("#{root}/**/*.conf");
puts("Finished!")

puts("# Results found: #{result.length()}")

# Print out results
result.each { |ii|
    puts(ii)
}