#
# The provisioning is parsed from the .gitlab-ci.yml's "pages" job.
#

require 'pathname'
require 'tempfile'
require 'yaml'

srvpath = Pathname.new(File.dirname(__FILE__)).realpath
configfile = YAML.safe_load_file(File.join(srvpath, "/.gitlab-ci.yml"), aliases: true)
ci_project_dir = '/vagrant'

sourcepath = '/etc/profile.d/env.sh'
header = "#!/bin/bash -ex\nsource #{sourcepath}\ncd $CI_PROJECT_DIR\n"

# set up essential environment variables
env = Hash.new
env['CI_PROJECT_DIR'] = "#{ci_project_dir}"
env_file = Tempfile.new('env')
File.chmod(0644, env_file.path)
env.each do |k,v|
    env_file.write("export #{k}='#{v}'\n")
end
env_file.write("\ncd $CI_PROJECT_DIR\n")
env_file.rewind

script_file = Tempfile.new('script')
File.chmod(0755, script_file.path)
script_file.write(header)
configfile['pages']['script'].flatten.each do |line|
    script_file.write(line.sub!('./tools/i18n.sh', ''))
    script_file.write("\n")
    # necessary so that the vagrant user can run `bundle install --local`
    script_file.write("rm -rf /var/lib/gems/*/bundler/gems/jekyll-*\n")
    script_file.write("chown -R vagrant:vagrant /home/vagrant/\n")
    script_file.write("\n")
end
script_file.rewind

Vagrant.configure("2") do |config|
  config.vm.box = "debian/bookworm64"
  config.vm.network "forwarded_port", guest: 4000, host: 4000
  config.vm.provision "file", source: env_file.path, destination: 'env.sh'
  config.vm.provision :shell, inline: <<-SHELL
    set -ex

    # make sure jekyll doesn't crash when it tries to register a ton of inotfy watches
    echo fs.inotify.max_user_watches=524288 >> /etc/sysctl.conf
    sysctl -p

    apt-get --allow-releaseinfo-change-suite update  # buster went from stable to oldstable
    apt-get -qy remove grub-pc  # updating grub requires human interaction
    apt-get -qy install git

    mv ~vagrant/env.sh #{sourcepath}
    source #{sourcepath}
SHELL
  config.vm.provision :shell, inline: configfile['.apt-template']
  config.vm.provision :shell, inline: configfile['.setup_for_jekyll']
  config.vm.provision "file", source: script_file.path, destination: 'script.sh'
  config.vm.provision :shell, inline: '/home/vagrant/script.sh'

  # remove this or comment it out to use VirtualBox instead of libvirt
  config.vm.provider :libvirt do |libvirt|
    libvirt.memory = 2048
  end
end
