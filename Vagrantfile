require 'pathname'
require 'yaml'

srvpath = Pathname.new(File.dirname(__FILE__)).realpath
configfile = YAML.load_file(File.join(srvpath, "/.gitlab-ci.yml"))

Vagrant.configure("2") do |config|
  config.vm.box = "debian/buster64"
  config.vm.network "forwarded_port", guest: 4000, host: 4000
  config.vm.provision :shell, inline: configfile['.apt-template']
  config.vm.provision :shell, inline: "apt-get install --install-recommends git libunicode-linebreak-perl po4a"
  config.vm.provision :shell, inline: "\
  apt-get install \
    gettext \
    linkchecker \
    python3-babel \
    rsync \
    rubocop \
    ruby-bundler \
    ruby-git \
    ruby-jekyll-include-cache \
    ruby-jekyll-paginate-v2 \
    ruby-jekyll-redirect-from \
    ruby-json \
    ruby-loofah \
    ruby-nokogiri \
    ruby-rchardet \
    ruby-rouge \
    ruby-rspec \
    ruby-zip \
    unzip"
end
