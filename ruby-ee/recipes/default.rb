%w(build-essential zlib1g-dev libssl-dev libreadline5-dev sqlite3).each do |p|
  package p
end
 
url = node[:ruby_enterprise_edition][:url]
tarball = url.split('/').last
name = tarball.split('.tar.gz').first
 
remote_file "/usr/local/src/#{tarball}" do
  source url
  
  only_if { !File.exists?("/usr/local/src/#{tarball}") }
end
 
execute "unpack_ruby_enterprise_edition" do
  cwd "/usr/local/src"
  command "tar -zxf #{tarball}"

  only_if { !File.exists?("/usr/local/src/#{name}") }
end

execute "install_ruby_enterprise_edition" do
  cwd "/usr/local/src/#{name}"
  command "./installer --auto /usr/local"
 
  only_if only_if node[:ruby_enterprise_edition][:only_if]
end
