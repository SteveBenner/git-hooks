#!/usr/bin/env ruby
#
# This script converts all tabs into spaces in all the source code files
# within the current git repository, as defined by TAB_SIZES.
#
TAB_SIZES  = {rb: 2, coffee: 2, sass: 2, slim: 2, js: 4}
EXTENSIONS = TAB_SIZES.keys.map { |ext| ".#{ext.to_s}" }
`git ls-files --full-name`.split.select { |f| EXTENSIONS.include? File.extname(f) }.each do |file|
  path      = File.expand_path(file)
  space_str = ' ' * TAB_SIZES[File.extname(file)[1..-1].to_sym]
  File.write path, File.open(path) { |f| f.read.gsub(/\t/, space_str) }
end
# After replacing tabs, modified files must once more be added to the Git index and committed
MODIFIED = `git ls-files -m`.split
if MODIFIED.size > 1
  `git add #{EXTENSIONS.collect { |e| '*' + e }.join(' ')}`
  `git commit -m 'GIT HOOK: Converted all tabs into spaces in #{MODIFIED.count} files.'`
end